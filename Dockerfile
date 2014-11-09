FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive
ADD consul /app/consul
ADD consul-template /usr/bin/consul-template
ADD run.sh /run.sh

CMD /run.sh
