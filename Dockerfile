FROM ruby:2.3.1-slim
COPY sudoers /etc/
RUN apt-get update && \
    apt-get install sudo && \
    useradd -u 1000 -G wheel -m debian && \
    mkdir /var/www && \
    rm -rf /var/lib/apt/lists/*
VOLUME /var/www /var/log
WORKDIR /var/www
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" BUNDLE_BIN="/var/www/bin"
EXPOSE 3000
USER debian
