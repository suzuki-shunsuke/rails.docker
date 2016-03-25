# rails.docker

Docker Hub Repository: https://hub.docker.com/r/suzukishunsuke/rails/

This is sample docker images for Ruby on Rails.  
The app directory is a sample rails application.

```
$ rails _4.2.5.2_ new app
$ vi app/apk.list
$ mkdir app/.bundle
$ vi app/.bundle/config
```

## Releases

tag | OS | ruby | rails
--- | --- | --- | ---
[0.1.0](https://github.com/suzuki-shunsuke/rails.docker/blob/0.1.0/Dockerfile) | alpine 3.3 | 2.3.0 | 4.2.5.2
[0.1.1](https://github.com/suzuki-shunsuke/rails.docker/blob/0.1.1/Dockerfile) | alpine 3.3 | 2.3.0 | 4.2.5.2

## 0.1.1

Manage bundle config with git.

## 0.1.0

* python 2.7.11
* pip 8.1.1
* supervisor 3.2.3
