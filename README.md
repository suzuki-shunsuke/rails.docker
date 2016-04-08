# rails.docker

Docker Hub Repository: https://hub.docker.com/r/suzukishunsuke/rails/

## 0.2.1

* alpine 3.3
* ruby 2.3.0
* monit 5.15
* Data Volumes
  * /etc/monit
  * /var/log
  * /var/www
* EXPOSE: 80

```
$ docker run -d -p 3000:80 -v (rails application root directory):/var/www suzukishunsuke/rails:0.2.1
```

```
/var/www
  Gemfile
  init.sh
  server.sh
  apk.list
  (etc)
```

example of /var/www/init.sh

```
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

example of /var/www/server.sh

```
bundle exec rails server -p 80 -b 0.0.0.0
```

example of /var/www/apk.list

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

## 0.1.1

* python 2.7.11
* pip 8.1.1
* supervisor 3.2.3

