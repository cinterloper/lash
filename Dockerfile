FROM ubuntu:16.04
ADD project /opt/lash
RUN apt update && apt install -y sudo python python-pip libluajit-5.1-dev luajit make cmake clang curl luarocks git libssl-dev autoconf libnice-dev libglib2.0-dev openjdk-8-jdk jq groovy2 libdw1 ; apt clean
RUN cd /opt; wget  https://github.com/sctplab/usrsctp/archive/0.9.3.0.zip; unzip 0.9.3.0.zip; cd usrsctp-0.9.3.0;./bootstrap && ./configure && make && make install
RUN cd /opt/lash/lib/ext/ctypes.sh && ./configure && make && make install
ENV LASH_PATH="/opt/lash"
RUN luarocks install turbo
RUN cd /opt; git clone https://github.com/torch/distro.git torch --recursive && cd torch && bash install-deps && ./install.sh


RUN cd /opt/lash/lib/ext/bats; ./install.sh /usr/local/
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c 'source /root/.sdkman/bin/sdkman-init.sh && sdk i vertx && sdk i groovyserv'
RUN echo "source /opt/lash/bin/init.sh" >> /etc/bash.bashrc
RUN echo "source ctypes.sh" >> /etc/bash.bashrc
RUN echo "source /root/.sdkman/bin/sdkman-init.sh >> /etc/bash.bashrc"
RUN bash -c 'echo CLASSPATH=$CLASSPATH:$(find /root/.sdkman/candidates/vertx/current/lib/ | while read fl; do echo -n $fl:; done)' >> /etc/bash.bashrc
RUN cd /opt; wget https://github.com/zdevito/terra/releases/download/release-2016-03-25/terra-Linux-x86_64-332a506.zip; unzip terra-Linux-x86_64-332a506.zip
RUN echo 'PATH=$PATH:/opt/terra-Linux-x86_64-332a506/bin/' >> /etc/bash.bashrc
RUN echo 'LUA_CPATH="$LUA_CPATH;/opt/terra-Linux-x86_64-332a506/lib/?.so"' >> /etc/bash.bashrc
RUN bash -c '/root/.sdkman/candidates/groovyserv/current/bin/groovyclient'
RUN apt install nano
ENV TERM=xterm
CMD bash
