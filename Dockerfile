FROM ubuntu:18.04
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev gcc g++ build-essential python3 python3-pip python3-dev

RUN apt-get install -y apt-transport-https software-properties-common
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get update
RUN apt-get install -y r-base

# Install install2.r utility
RUN R -e "install.packages(c('littler', 'docopt'))"
RUN ln -s /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r
RUN ln -s /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r

# Install libs
RUN install2.r -e quantmod data.table readxl stringr pbapply
RUN install2.r -e forecast trend zoo tsoutliers lubridate gsubfn

# Install prophet library
RUN apt-get install -y libxml2-dev libssl-dev
RUN install2.r -e rstan -r "https://cloud.r-project.org/" -d "TRUE"
RUN install2.r -e prophet

 RUN python3 -m pip install --upgrade pip setuptools wheel
 RUN python3 -m pip install "azure-batch==6.0.0" "azure-storage-blob==1.3.1" "Theano>=1.0.0" "numpy>=1.15.0" "h5py>=2.8.0" "keras>=2.2.4" "scipy>=1.1.0" "pillow>=5.3.0" "tensorflow>=1.12.0" "pandas" "pytest"

CMD /bin/bash
