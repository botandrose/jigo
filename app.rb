require 'lib/gemlist'

get '/' do
  @gems = Gemlist.all
  haml :index
end

get '/rdoc.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :rdoc
end

get '/*' do
  path = params[:splat].first

  content_type 'text/css' if path =~ /\.css$/
  File.read("#{Gemlist.path}/doc/#{path}")
end
