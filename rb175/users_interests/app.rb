require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require 'yaml'

before do
  @yaml = YAML.load_file("users.yaml")
end

get "/" do
  erb :home 
end

get "/:name" do
  yaml = YAML.load_file("users.yaml")
  @name = params[:name].to_s
  @email = yaml[@name.to_sym][:email]
  @interests = yaml[@name.to_sym][:interests]

  redirect "/" unless yaml.key?(@name.to_sym)

  erb :profile
end

helpers do
  def comma_list(arr)
    arr.join(', ')
  end

  def count_interests
    total = 0
    @yaml.each_pair { |_, value| total += value[:interests].count }
    total
  end
end