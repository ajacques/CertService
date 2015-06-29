FROM ubuntu:15.04

RUN /usr/bin/apt-get update && /usr/bin/apt-get install -qy --no-install-recommends ruby ruby-dev libsqlite3-dev libsqlite3-0 make g++ && gem install bundler --no-ri --no-rdoc
ADD Gemfile /rails-app/Gemfile
ADD Gemfile.lock /rails-app/Gemfile.lock
WORKDIR /rails-app
RUN /usr/bin/env bundle install
ADD . /rails-app
RUN /bin/bash -c -l 'bundle install'
EXPOSE 3000
USER www-data
CMD unicorn -o 0.0.0.0 -p 3000 -c unicorn.rb
