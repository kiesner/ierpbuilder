FROM microsoft/vsts-agent:ubuntu-16.04

RUN apt-get install r-base libcurl4-openssl-dev
RUN R -e 'install.packages(c("quantmod", "data.table", "readxl", "stringr", "pbapply", "parallel", "forecast", "trend", "zoo", "tsoutliers", "lubridate", "gsubfn"), repos = c("https://cloud.r-project.org/","http://cloud.r-project.org/"))'

RUN apt-get install python3 python3-pip

RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install -r "src/setup/requirements.txt"
RUN python3 -m pip install pytest

CMD /bin/bash
