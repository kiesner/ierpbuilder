FROM microsoft/vsts-agent:ubuntu-16.04

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --allow-unauthenticated r-base libcurl4-openssl-dev
RUN R -e 'install.packages(c("quantmod", "data.table", "readxl", "stringr", "pbapply", "parallel", "forecast", "trend", "zoo", "tsoutliers", "lubridate", "gsubfn"), repos = c("https://cloud.r-project.org/", "http://cloud.r-project.org/"))'

RUN apt-get install python3 python3-pip

RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install "azure-batch==6.0.0" "azure-storage-blob==1.3.1" "Theano>=1.0.0" "numpy>=1.15.0" "h5py>=2.8.0" "keras>=2.2.4" "scipy>=1.1.0" "pillow>=5.3.0" "tensorflow>=1.12.0" "pandas" "pytest"

CMD /bin/bash
