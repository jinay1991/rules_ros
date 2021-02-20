FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 

RUN apt-get install -y \
    build-essential clang-format clang-tidy clangd git git-lfs \
    wget curl gnupg \
    openjdk-11-jdk openjdk-11-jre lcov \
    python3-pip python-is-python3

RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg && \
    mv bazel.gpg /etc/apt/trusted.gpg.d/ && \
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && apt-get install -y bazel && \
    echo "source /etc/bash_completion.d/bazel" >> ~/.bashrc

# Installation of Bazel Tools
RUN wget https://github.com/bazelbuild/buildtools/releases/download/3.5.0/buildifier && \
    chmod +x buildifier && \
    mv buildifier /usr/bin

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove && apt-get autoclean