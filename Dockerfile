FROM ruby:2.3.1-slim
RUN apt-get update && \
    apt-get install -y sudo wget && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb && \
    dpkg -i dumb-init_1.1.3_amd64.deb && \
    rm dumb-init_1.1.3_amd64.deb && \
    mkdir -p /var/www/.bundle && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/achives && \
    useradd -u 1000 -G sudo -m debian && \
    chown -R debian:debian /var/www && \
    chmod a-w /etc/sudoers
COPY config /var/www/.bundle
COPY sudoers /etc/
WORKDIR /var/www
ENV TERM="xterm" \
    BUNDLE_PATH="/var/www/vendor/bundle" \
    BUNDLE_BIN="/var/www/vendor/bundle/bin" \
    BUNDLE_APP_CONFIG="/var/www/vendor/bundle" \
    PATH="/var/www/vendor/bundle/bin:$PATH"
EXPOSE 3000
USER debian
ENTRYPOINT ["/usr/bin/dumb-init"]
