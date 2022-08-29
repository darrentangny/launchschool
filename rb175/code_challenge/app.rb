require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @files = Dir.glob("public/*.*").sort
  @files.reverse! if params[:sort] == "desc"
  erb :list
end