# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
run Sinatra::Application

#
# root = ::File.dirname(__FILE__)
# require ::File.join( root, 'app' )
# run MyApp.new
