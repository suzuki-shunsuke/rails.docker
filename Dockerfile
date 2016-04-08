FROM ruby:2.3.0-alpine
COPY monitrc rails.conf /root/
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" BUNDLE_BIN="/var/www/bin"
RUN apk update && \
    apk upgrade && \
    apk add monit && \
    mkdir -p /etc/monit/monit.d /var/www && \
    mv /root/monitrc /etc/monit/monitrc && \
    mv /root/rails.conf /etc/monit/monit.d && \
    rm /etc/monitrc && \
    ln -s /etc/monit/monitrc /etc/monitrc && \
    ln -s /etc/monit/monit.d /etc/monit.d && \
    chmod 700 /etc/monit/monitrc && \
    rm -rf /var/cache/apk/*
WORKDIR /var/www
VOLUME /var/www /etc/monit /var/log
EXPOSE 80
CMD monit -I
