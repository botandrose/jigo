require File.dirname(__FILE__) + '/lib/jigo'

set :root, Jigo.root
set :public, Jigo.root / "public"
set :views, Jigo.root / "views"

get '/' do
  @gems = Gemlist.all
  haml :index
end

get '/rdoc.css' do
  content_type 'text/css'
  sass :rdoc
end

get '/*' do
  path = params[:splat].first

  content_type 'text/css' if File.extname(path) == ".css"
  File.read("#{Gemlist.path}/doc/#{path}")
end
