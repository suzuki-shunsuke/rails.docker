FROM suzukishunsuke/ruby:0.1.2
COPY rails.conf /etc/supervisor/conf.d
COPY app /var/www
WORKDIR /var/www
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" BUNDLE_BIN="/var/www/bin"
RUN apk update && \
  apk upgrade && \
  pip install --upgrade pip supervisor && \
  cat apk.list | xargs apk add && \
  bundle install --path vendor/bundle && \
  rm -rf /var/cache/apk/*
VOLUME /var/www
EXPOSE 80
