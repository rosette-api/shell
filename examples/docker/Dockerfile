FROM ubuntu:14.04
MAINTAINER Chris Park <cpark@basistech.net>
ENV REFRESHED_AT 2016-02-04

RUN apt-get -yqq update \
    && apt-get install -y --force-yes --no-install-recommends\
    curl \
    ca-certificates \
    jq \
    iputils-ping

RUN mkdir /scripts
WORKDIR /scripts
COPY run-examples.sh run-examples.sh
RUN chmod 0755 run-examples.sh

# allow interactive bash inside docker container
CMD ./run-examples.sh $API_KEY $FILENAME $ALT_URL 

VOLUME ["/source"]
