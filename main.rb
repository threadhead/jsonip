require 'rubygems'
require "bundler/setup"
require 'sinatra'
require 'json'

get '/' do
  content_type :json
  @info = {
    ip: request.ip
  }

  data = JSON.dump(@info)
  if params[:callback]
    "#{params[:callback]}(#{data});"
  else
    data
  end

end