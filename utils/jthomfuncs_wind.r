#' Functions for calculations in the area of 
#' Wind Power Generation and Transmission
#' 
#' 
#' J. Thomas 13.Dec.2023


#' Calculate the saturation vapour pressure of water
#'
#' @param temperature vector of air temperatures in [degC]
#'
#' @return saturation pressure of water vapor in [mbar]
#'
#' @examples p_sat <- calc_sat_water_vapour_press(air_temperature)
calc_sat_water_vapour_press <- function(temperature) {
    
    tem <- temperature
        
    es0 <- 6.1078

    c0 <- 0.99999683
    c1 <- -0.90826951e-2
    c2 <- 0.78736169e-4
    c3 <- -0.61117958e-6
    c4 <- 0.43884187e-8
    c5 <- -0.29883885e-10
    c6 <- 0.21874425e-12
    c7 <- -0.17892321e-14
    c8 <- 0.11112018e-16
    c9 <- -0.30994571e-19

    # Herman Wobus polynomial
    # https://wahiduddin.net/calc/density_altitude.htm
    
    pol <- c0+tem*(c1+tem*(c2+tem*(c3+tem*(c4+tem*(c5+tem*(c6+tem*(c7+tem*(c8+tem*(c9)))))))))
    
    p_sat <- es0 / pol**8 # [hpas] = [mbar] # 1 mbar = 100 Pa
    
    # Approx.Tetens Eq. [mbar] p_sat = es0*10**((7.5*tem)/(237.3+tem))

    p_sat
}


#' Calculate the humid air density
#' Sources:
#' https://en.wikipedia.org/wiki/Density_of_air#Hum
#' https://wahiduddin.net/calc/density_altitude.htm
#' 
#' @param temperature vector of air temperatures in [degC]
#' @param relative_humidity RH [0.0, 1.0]
#' @param pressure atmospheric pressure in [mbar]
#' 
#' @return humid air density [kg/m**3]
#'
#' @examples rho_h <- calc_humid_air_density(air_temperature, relative_humidity, pressure)
calc_humid_air_density <- function(temperature, relative_humidity, pressure) {
    
    # Constants:
    # R = 8314.32 # Universal gas constant (in 1976 Standard Atmosphere)
    # Md = 28.964 # molecular weight of dry air [gm/mol]
    # Mv = 18.016 # molecular weight of water vapor [gm/mol]
    
    Rd <- 287.05 # J/(kg*degK)  | Gas constant for dry air (R/Md)
    Rv <- 461.495 # J/(kg*degK) | Gas constant for water vapor (R/Mv)

    p_sat_vap <- calc_sat_water_vapour_press(temperature) # [mbar]
    p_vap <- relative_humidity * p_sat_vap # [mbar]

    # pressure = p_dry + p_vap = total air pressure
    p_dry <- pressure - p_vap # [mbar]

    p_dPa <- p_dry * 100 # [Pa] pressure of dry air (partial pressure)
    p_vPa <- p_vap * 100 # [Pa] pressure of water vapor (partial pressure)
        
    temK <- temperature + 273.15

    rho_h <- (p_dPa / (Rd * temK)) + (p_vPa / (Rv * temK))

    rho_h
}


#' Calculate Tip-speed Ratio (TSR)
#' 
#' @param tip_speed Linear speed of blade tip [m/s]
#' @param wind_speed in [m/s]
#' @return tip-speed ratio [0, 1]
calc_tsr <- function(tip_speed, wind_speed) {

    tsr <- tip_speed / wind_speed
    tsr

}


#' Calculate the output power of a wind turbine
#' 
#' @param rated_power in [kW]
#' @param area circular swept area in [squared metres]
#' @param Cp Power Coefficient
#' @param cut_in cut-in wind speed [m/s]
#' @param cut_out cut-out wind speed [m/s]
#' @param air_density dry or humid air density [kg/m**3]
#' @param wind_speed in [m/s]
#' @return generated electrical power [kW]
calc_wt_output_power <- function(rated_power, area, power_coeff, cut_in, cut_out, air_density, wind_speed) {

    # Cut-in / cut-out
    wind_speed <- ifelse(wind_speed < cut_in, 0, wind_speed)
    wind_speed <- ifelse(wind_speed > cut_out, 0, wind_speed)

    p_out <- (power_coeff * area * air_density * wind_speed**3) / 2 # [W]
    p_out <- p_out / 1000 # [kW]

    # Power Ratings
    p_out <- ifelse(p_out > rated_power, rated_power, p_out)

    p_out
}
