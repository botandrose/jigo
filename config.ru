root_dir = File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :app_file => File.join(root_dir, 'app.rb'),
  :views => File.join(root_dir, 'views'),
  :env => ENV['RACK_ENV'].to_sym
)

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

if File.exists?(File.join(root_dir,'tmp', 'debug.txt'))
  require 'ruby-debug'
  Debugger.wait_connection = true
  Debugger.start_remote
  File.delete(File.join(root_dir,'tmp', 'debug.txt'))
end

run Sinatra.application
