require 'rubygems'
require 'bundler'
require 'sinatra'

Bundler.require
disable :run

require './server'
run Sinatra::Application
