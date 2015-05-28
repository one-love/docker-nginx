FROM nginx:latest
MAINTAINER Goran Mekić <meka@lugons.org>

ENV DEBIAN_FRONTEND noninteractive

ADD . /app
RUN /app/bin/build.sh
CMD /app/bin/run.sh
