FROM suzukishunsuke/rails:2.1.0-base
RUN useradd -u 900 -G sudo -m debian && \
    chown -R debian:debian /var/www
USER debian
