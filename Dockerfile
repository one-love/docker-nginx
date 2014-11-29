FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive
ADD consul /etc/nginx/consul
ADD run.sh /etc/nginx/run.sh

CMD /etc/nginx/run.sh
