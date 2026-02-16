FROM ubuntu:latest
RUN apt-get update && apt-get install -y unzip wget
RUN mkdir /dawn_workspace
WORKDIR /dawn_workspace

RUN wget -q -O- https://api.github.com/repos/DawnScience/dawn-website/releases/latest | grep -wo "https.*linux.x86_64.zip" | wget -qi-
RUN unzip -q "*.zip"
