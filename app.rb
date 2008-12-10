RDOC_ROOT = '/usr/lib/ruby/gems/1.8/doc/'

get '/' do
  dir = Dir.new RDOC_ROOT
  dir.each do |f|
    puts f
  end
end
