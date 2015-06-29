require 'yaml'
require 'active_record'
require 'net/http'

env = ENV['RACK_ENV'] || 'development'
ActiveRecord::Base.logger = Logger.new(STDOUT)
dbconfig = YAML.load File.open 'database.yml'
ActiveRecord::Base.establish_connection dbconfig[env]

get '/ping' do
  'Healthy'
end
