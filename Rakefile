require 'rubygems'
require 'active_record'
require 'yaml'

env = ENV['RACK_ENV'] || 'development'

namespace :db do
	task :environment do
		@config = YAML.load File.open 'database.yml'
		ActiveRecord::Base.establish_connection @config[env]
	end
	desc "Create database"
	task :create => :environment do
		begin
      ActiveRecord::Base.connection
		rescue Exception => e
			puts e
		end
	end

	desc "Migrate the database"
	task :migrate => :environment do
		begin
			ActiveRecord::Migrator.migrate('db/migrate')
		rescue Exception => e
			puts e
		end
	end

	desc 'Load the seed data from db/seeds.rb'
	task :seed => :environment do
  	seed_file = File.join('db/seeds.rb')
  	load(seed_file) if File.exist?(seed_file)
	end

end
