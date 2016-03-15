FROM ubuntu:14.04
MAINTAINER Chris Park <cpark@basistech.net>
ENV REFRESHED_AT 2016-02-04

RUN apt-get -yqq update \
    && apt-get install -y --force-yes --no-install-recommends\
    curl \
    ca-certificates \
    jq \
    iputils-ping

RUN mkdir rosette
WORKDIR rosette
ENV ALT_URL "na"
ENV FILENAME "na"
COPY run-examples.sh run-examples.sh

VOLUME ["source"]

CMD ./run-examples.sh -a $API_KEY -f $FILENAME -u $ALT_URL

