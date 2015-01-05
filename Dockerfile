FROM debian:wheezy

RUN /usr/bin/apt-get update && /usr/bin/apt-get install -qy --no-install-recommends ruby1.9.1 bundler thin libmysqlclient-dev
ADD . /rails-app
WORKDIR /rails-app
RUN /bin/bash -c -l 'bundle install'
EXPOSE 3000
CMD thin -R config.ru -u www-data -g www-data start
