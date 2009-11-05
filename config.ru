require 'rubygems'
require 'sinatra'
require 'app'

use Rack::ShowExceptions

ROOT = File.dirname(__FILE__)

if File.exists?(File.join(ROOT, 'tmp', 'debug.txt'))
  require 'ruby-debug'
  Debugger.wait_connection = true
  Debugger.start_remote
  File.delete(File.join(ROOT, 'tmp', 'debug.txt'))
end

log = File.new("sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

set :environment, ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development

run Sinatra::Application
