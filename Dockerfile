FROM ubuntu:latest

RUN apt-get update
RUN yes | apt-get install software-properties-common

RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN yes | apt-get install git python sudo

ENV PATH $PATH:/opt/chrome/depot_tools
RUN export PATH=$PATH:/opt/chrome/depot_tools
