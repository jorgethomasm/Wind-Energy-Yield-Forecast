# Setting an R environment from scratch 
# Step 1 - Import base image
FROM rocker/r-ver:4.3.1 

# Step 2 - Set arguments and environment variables
# Define arguments
ARG CRAN_MIRROR=https://cran.rstudio.com/
# ARG QUARTO_VER="1.3.450"

# Define environment variables
ENV TZ=UTC

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils\
    gfortran \
    git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    locales \
    openjdk-8-jdk \
    screen \
    texinfo \
    texlive \
    texlive-fonts-extra \
    vim \
    wget \
    xvfb \
    tzdata \
    sudo\
    jq\
    curl\
    libgit2-dev \
    libmagick++-dev \
    make \
    tmux \
    python3-launchpadlib \
    python3.10-dev \
    python3.10-venv \
    python3-pip \
    libharfbuzz-dev \
    libfribidi-dev \
    && rm -rf /var/lib/apt/lists/*

# RUN locale-gen en_US.UTF-8
RUN locale-gen de_DE && locale-gen de_DE.UTF-8 && update-locale

WORKDIR /root

COPY . /root/

RUN mkdir settings
COPY requirements.txt packages.json renv.lock install_packages.R  install_quarto.sh ./settings/

# WORKDIR /settings

# COPY ./requirements.txt .
# COPY ./packages.json .
# COPY ./renv.lock .
# COPY ./install_packages.R .
# COPY ./install_quarto.sh .

# COPY . /home/app
# RUN rm -f /home/app/.Rprofile

# RUN Rscript install_packages.R
RUN Rscript ./settings/install_packages.R

RUN Rscript -e "renv::restore()"

# RUN rm -f renv.lock

# Installing Quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb && \
    sudo dpkg -i quarto-linux-amd64.deb && \
    rm -f quarto-linux-amd64.deb

# Python's Virtual Environment
RUN python3 -m venv /venv  \
    && export PATH=/venv/bin:$PATH \
    && echo "source /venv/bin/activate" >> ~/.bashrc

# RUN . venv/bin/activate 
RUN pip install --upgrade pip

RUN pip3 install  --no-cache-dir -r requirements.txt

#CMD ["bash"]