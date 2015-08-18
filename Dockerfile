FROM alpine
MAINTAINER Mathias Kaufmann <me@stei.gr>
ENTRYPOINT ["metadata-proxy"]
RUN apk add --update ruby ruby-dev ruby-json openssl \
 && gem update --system --no-ri --no-rdoc \
 && gem install --no-ri --no-rdoc net-http-server unirest uuidtools gserver \
 && apk del ruby-dev \
 && rm -r /var/cache/apk/*
ADD metadata-proxy /bin/metadata-proxy