# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

use Rack::ReverseProxy do
  reverse_proxy /^\/blog(\/.*)$/, 'http://owfleek.flywheelsites.com$1', :username => 'emmanuel974261', :password => 'Yelokolikimymane971', :timeout => 500, :preserve_host => true
end

run Rails.application
