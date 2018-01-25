FROM alpine:latest
LABEL maintainer="lunksana <zoufeng4@gmail.com>"

ENV BUILDPATH='git make linux-headers pcre-dev libev-dev automake libtool c-ares-dev gcc libsodium-dev mbedtls-dev libc-dev'
ENV PASSWORD=PASSWORD
ENV METHOD=chacha20-ieft-poly1305
ENV PLUGIN=obfs-server
ENV PLUGIN_OPT='obfs=http'
ENV SS_MOD=ss-server
ENV ENABLE_OBFS='N'

RUN apk update && \
    apk upgrade

RUN apk add ${BUILDPATH} && \
    mkdir /ss && \
    cd /ss && \
    git clone https://github.com/shadowsocks/shadowsocks-libev && \
    git clone https://github.com/shadowsocks/simple-obfs && \
    cd shadowsocks-libev && \
    git submodule init && \
    git submodule update && \
    ./autogen.sh && \
    ./configure --disable-documentation && \
    make && make install && \
    cd ../simpl-obfs && \
    git submodule init && \
    git submodule update && \
    ./autogen.sh && \
    ./configure --disable-documentation && \
    make && make install && \
    rm -rf /ss &&\
    apk del ${BUILDPATH}

ADD start.sh /
RUN chmod +x /start.sh
EXPOSE 443
EXPOSE 1080
ENTRYPOINT [ "/start.sh" ]