FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive
ADD confd /etc/confd
RUN /etc/confd/build.sh
CMD /etc/confd/run.sh
