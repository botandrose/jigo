require 'sass'
require 'haml'

# load everything in /lib
Dir.new('lib').each do |file|
  require "lib/#{file}" if file =~ /\.rb$/ and file != 'jigo.rb'
end

module Jigo
  def self.root
    File.expand_path(File.join(File.dirname(__FILE__), ".."))
  end
end
