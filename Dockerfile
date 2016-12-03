FROM alpine:latest
MAINTAINER lunksana <zoufeng4@gmail.com>
RUN apk update && \
    apk upgrade && \
    apk install git && \
    