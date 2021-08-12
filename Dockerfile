# Base image to use
FROM ubuntu:20.04

MAINTAINER Skyler Kuhn <skyler.kuhn@nih.gov>

# Create Container filesystem specific 
# working directory and opt directories 
RUN mkdir -p /opt2 && mkdir -p /data2
WORKDIR /opt2 

# Set time zone to US east coast 
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# This section installs system packages required for your project
# If you need extra system packages add them here.
RUN apt-get update \
 && apt-get -y upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      python3 \
      python3-pip \
      git \
      curl \
      locales 

# install docker in this docker
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io

# Set the locale
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

# Install recent Node.js from NodeSource
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash \
 && apt-get install -y nodejs \
 && npm config --global set user root

# Install Dockta from NPM
RUN npm install --global @stencila/dockta

# Install ACT from Github
# and install required python packages
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/STRIDES-Codes/ACT.git && \
    chmod -R a+rX /opt2 && \
    cd /opt2/ACT/ && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt
ENV PATH="/opt2/ACT":$PATH

# Add Dockerfile to container filesystem
ADD Dockerfile /opt2/Dockerfile
WORKDIR /data2

# cleaning up
RUN apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*