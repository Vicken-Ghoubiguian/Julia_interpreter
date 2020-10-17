# Definition of based image for the generation of Docker image
FROM ubuntu:latest

# Definition of maintainer (me)
LABEL maintainer="ericghoubiguian@live.fr"

# Upgrade and update all installed packages
RUN apt upgrade -y && apt update -y

# Installation of necessary package on ubuntu based image: curl
RUN apt install curl -y

# Download of the latest version of Julia language
RUN curl -R -O https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.2-linux-x86_64.tar.gz

#
RUN tar -xvzf julia-1.5.2-linux-x86_64.tar.gz

#
RUN cp -r julia-1.5.2 /opt/

#
RUN ln -s /opt/julia-1.5.2/bin/julia /usr/local/bin/julia

# Define the executable of Docker container's process
ENTRYPOINT ["julia"]
