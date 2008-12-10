require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => ENV['RACK_ENV'],
  :raise_errors => true
)

use Rack::ShowExceptions

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app'
run Sinatra.application
