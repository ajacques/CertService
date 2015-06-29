listen 3000
preload_app true
worker_processes 4

if GC.respond_to? :copy_on_write_friendly=
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
end
