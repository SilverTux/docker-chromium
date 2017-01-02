FROM ubuntu:latest

RUN apt-get update
RUN yes | apt-get install software-properties-common

RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN yes | apt-get install git python

RUN mkdir -p /opt/chrome/ && cd /opt/chrome/
#RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
COPY . /opt/chrome
ENV PATH $PATH:/opt/chrome/depot_tools
RUN export PATH=$PATH:/opt/chrome/depot_tools

RUN mkdir /opt/chrome/chromium && cd /opt/chrome/chromium
RUN fetch --nohooks android

VOLUME /opt/chrome
