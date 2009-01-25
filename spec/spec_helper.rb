require 'rubygems'
require 'sinatra'
require 'sinatra/test/rspec'
require 'rspec_hpricot_matchers'
include RspecHpricotMatchers
 
Sinatra::Application.set({
  :environment => :test,
  :run => false,
  :raise_errors => true,
  :logging => false
})
 
require File.dirname(__FILE__) + '/../lib/jigo'
