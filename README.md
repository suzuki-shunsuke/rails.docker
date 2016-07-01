# rails.docker

Docker Hub Repository: https://hub.docker.com/r/suzukishunsuke/rails/

* Debian jessie
* ruby 2.3.1
* WORKDIR: /var/www
* Data Volumes
  * /var/log
  * /var/www
* EXPOSE: 3000
* USER: debian(uid=1000, group=wheel, nopassword)

```
$ docker run -d --name rails -p 3000:3000 -v (rails application root directory):/var/www suzukishunsuke/rails:1.0.0
$ docker exec rails sh init.sh
$ docker exec rails bundle exec rails server -b 0.0.0.0 -p 3000
```

example of rails application root directory

```
Gemfile
init.sh
apt.list
(etc)
```

example of init.sh

```
#!/bin/sh

set -eu

if which apt-get
then
    sudo apt-get update
    grep -v "^ *#" apt.list | sed -e "s/ *\(.*\) *#.*/\1/" | xargs sudo apt-get install
fi

bundle config build.nokogiri --use-system-libraries
bundle install --path vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

example of apt.list

```
# Required Debian package list
build-essential
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

# git  # comment out
```
