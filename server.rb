require 'sinatra'
require 'yaml'
require 'json'
require 'active_record'
require 'net/http'

env = ENV['RACK_ENV'] || 'development'
dbconfig = YAML.load(File.read('database.yml'))
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection dbconfig[env]
