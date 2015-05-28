FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive

ADD . /app
RUN /app/bin/build.sh
CMD consul-template -config /app/consul/nginx.conf
