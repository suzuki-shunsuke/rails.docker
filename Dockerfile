FROM suzukishunsuke/rails:0.2.0
COPY monitrc /etc/monit/monitrc
COPY rails.conf /etc/monit/monit.d
RUN apk update && \
  apk upgrade && \
  chmod 700 /etc/monit/monitrc && \
  rm -rf /var/cache/apk/*
