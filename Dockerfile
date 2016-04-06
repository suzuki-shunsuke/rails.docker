FROM suzukishunsuke/ruby:0.2.0
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" BUNDLE_BIN="/var/www/bin"
RUN apk update && \
  apk upgrade && \
  mkdir /var/www && \
  rm -rf /var/cache/apk/*
WORKDIR /var/www
VOLUME /var/www
EXPOSE 80
