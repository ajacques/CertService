FROM ubuntu:15.04

RUN /usr/bin/apt-get update && /usr/bin/apt-get install -qy --no-install-recommends ruby ruby-dev libmysqlclient-dev make g++ && gem install bundler --no-ri --no-rdoc
ADD . /rails-app
WORKDIR /rails-app
RUN /bin/bash -c -l 'bundle install'
EXPOSE 3000
USER www-data
CMD unicorn -o 0.0.0.0 -p 3000 -c unicorn.rb
