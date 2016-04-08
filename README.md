# rails.docker

Docker Hub Repository: https://hub.docker.com/r/suzukishunsuke/rails/

## 0.2.2

* alpine 3.3
* ruby 2.3.0
* monit 5.15
* WORKDIR: /var/www
* Data Volumes
  * /etc/monit
  * /var/log
  * /var/www
* EXPOSE: 80

```
$ docker run -d --name rails -p 3000:80 -v (rails application root directory):/var/www suzukishunsuke/rails:0.2.2
$ docker exec rails sh init.sh
$ docker exec rails monit
```

example of rails application root directory

```
Gemfile
init.sh
apk.list
(etc)
```

example of init.sh

```
#!/bin/sh

set -eu

if which apk
then
    apk update
    grep -v "^ *#" apk.list | sed -e "s/ *\(.*\) *#.*/\1/" | xargs apk add
fi

bundle config build.nokogiri --use-system-libraries
bundle install --path vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

example of apk.list

```
# Required Alpine Linux package list
build-base
curl-dev # comment
libxml2-dev
libxslt-dev
nodejs
ruby-dev
sqlite-dev
tzdata
yaml-dev
zlib-dev
libffi

# bash  # comment out
```
