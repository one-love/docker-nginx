FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive
ADD consul /app/consul
ADD run.sh /app/run.sh

CMD /app/run.sh
