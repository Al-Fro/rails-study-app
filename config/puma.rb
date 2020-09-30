workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end


# max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
# min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
# threads min_threads_count, max_threads_count

# # Specifies the `port` that Puma will listen on to receive requests; default is 3000.
# #
# port        ENV.fetch('PORT') { 3000 }

# # Specifies the `environment` that Puma will run in.
# #
# environment ENV.fetch('RAILS_ENV') { 'development' }

# # Specifies the `pidfile` that Puma will use.
# pidfile ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }

# plugin :tmp_restart
