ARG CORE_VERSION="latest"
FROM --platform=linux/amd64 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-core-runtime:${CORE_VERSION}

RUN dnf update -y && \
    dnf install -y  \
    tar \
    wget \
    unzip \
    gzip && \
    dnf clean all && \
    wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz && \
    tar xvf openjdk-17_linux-x64_bin.tar.gz && \
    mv jdk-17 /opt/

ENV JAVA_HOME="/opt/jdk-17"

ENV PATH="$PATH:opt/jdk-17/bin"