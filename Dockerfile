FROM ruby:2.3.1-slim
RUN apt-get update && \
    apt-get install -y sudo wget && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64.deb && \
    dpkg -i dumb-init_1.1.1_amd64.deb && \
    rm dumb-init_1.1.1_amd64.deb && \
    useradd -u 1000 -G sudo -m debian && \
    mkdir /var/www && \
    rm -rf /var/lib/apt/lists/*
VOLUME /var/www /var/log
COPY sudoers /etc/
RUN chmod a-w /etc/sudoers
WORKDIR /var/www
ENV BUNDLE_APP_CONFIG="/var/www/.bundle" TERM="xterm"
EXPOSE 3000
USER debian
ENTRYPOINT ["/usr/bin/dumb-init"]
