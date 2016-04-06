# rails.docker

Docker Hub Repository: https://hub.docker.com/r/suzukishunsuke/rails/

## Releases

tag | OS | ruby | rails
--- | --- | --- | ---
[0.1.1](https://github.com/suzuki-shunsuke/rails.docker/blob/0.1.1/Dockerfile) | alpine 3.3 | 2.3.0 | 4.2.5.2

## 0.2.0

* alpine 3.3
* ruby 2.3.0
* monit 5.15
* Data Volumes
  * /etc/monit
  * /var/log
  * /var/www
* EXPOSE: 80

```
$ docker run -d -p 3000:80 -v $PWD/rails:/var/www $PWD/monit:/etc/monit suzukishunsuke/rails:0.2.0
```

```
/var/www
  Gemfile
  init.sh
  server.sh
  apk.list
  (etc)
```

example of /etc/monit/monit.d/rails.conf

```
check process rails with pidfile /var/www/tmp/pids/server.pid
     start = "cd /var/www && sh init.sh && sh server.sh"
     stop  = "kill $(cat /var/www/tmp/pids/server.pid)"
```

example of /var/www/init.sh

```
if which apk
then
    apk update
    grep -v "^ *#" apk.list | sed -e "s/ *\(.*\)#.*/\1/" | xargs apk add
fi
bundle config build.nokogiri --use-system-libraries
bundle install --path vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

example of /var/www/server.sh

```
bundle exec rails server -p 80 -b 0.0.0.0
```

## 0.1.1

* python 2.7.11
* pip 8.1.1
* supervisor 3.2.3

