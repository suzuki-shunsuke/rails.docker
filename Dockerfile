FROM ruby:2.3.0-alpine
COPY sudoers /etc/
COPY init.sh /var/
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" BUNDLE_BIN="/var/www/bin"
RUN apk update && \
    apk add sudo && \
    adduser -u 1000 -G wheel -D alpine && \
    chmod 777 /var/init.sh && \
    rm -rf /var/cache/apk/*
WORKDIR /var/www
VOLUME /var/www /var/log
EXPOSE 3000
USER alpine
CMD sh /var/init.sh
