# Wind Energy Yield Forecast

## Description

This project showcases a dashboard with the potential energy yield of a [Goldwind](https://www.goldwind.com/en/) turbine on the German coast of the North Sea.

Note that the **assessment is an overestimate** given that:
- Maintenance and failure risk is not taken into account.
- Energy lost due to nacelle rotation is not taken into account. Latest studies have shown losts of around 6% due to turbulence created; this generates bad readings for the control system.
   

In order to answer the question regarding **site assessment**:

### What's the potential energy yield of a wind turbine on X site?

I can substitute the forecast data with historical on-site records.

## Tech Stack

- Quarto
- Python
- Open Meteo
- Numeric Weather Prediction (NWP): DWD ICON
- R
- ggplot
- plotly
