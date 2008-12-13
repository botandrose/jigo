ROOT = File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :app_file => File.join(ROOT, 'app.rb'),
  :views => File.join(ROOT, 'views'),
  :env => ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
)

use Rack::ShowExceptions

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

if File.exists?(File.join(ROOT,'tmp', 'debug.txt'))
  require 'ruby-debug'
  Debugger.wait_connection = true
  Debugger.start_remote
  File.delete(File.join(ROOT,'tmp', 'debug.txt'))
end

run Sinatra.application
