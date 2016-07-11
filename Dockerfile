FROM ubuntu:16.04
ADD . /opt/lash
RUN apt update && apt install -y libluajit-5.1-dev luajit make cmake clang curl luarocks git libssl-dev; apt clean
ENV LASH_PATH="/opt/lash"
RUN luarocks install turbo
