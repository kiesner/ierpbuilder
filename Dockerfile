FROM microsoft/vsts-agent:ubuntu-16.04

RUN apt-get install python3 python3-pip
RUN apt-get install r-base

RUN python3 -m pip install --upgrade pip setuptools wheel


CMD /bin/bash
