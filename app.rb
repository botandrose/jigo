RDOC_ROOT = '/usr/lib/ruby/gems/1.8/doc/'

error do
  status 500
  'So what happened was...' + request.env['sinatra.error'].message
end

get '/' do
  dir = Dir.new RDOC_ROOT
  dirs = dir.collect do |f|
    File.new f
  end
  puts dirs.inspect
end
