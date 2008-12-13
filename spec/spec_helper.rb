require File.dirname(__FILE__) + '/../lib/jigo'
require 'spec'
require 'spec/interop/test'
require 'sinatra/test/methods'
require 'rspec_hpricot_matchers'
include RspecHpricotMatchers
 
include Sinatra::Test::Methods
 
Sinatra::Application.default_options.merge!(
  :env => :test,
  :run => false,
  :raise_errors => true,
  :logging => false
)
 
#Sinatra.application.options = nil
