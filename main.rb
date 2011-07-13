require 'rubygems'
require "bundler/setup"
require 'sinatra'
require 'json'

get '/' do
  allowed_hosts = ENV["ALLOWED_HOSTS"].split(",") rescue []
  return 403 unless allowed_hosts.include?(request.env["HTTP_REFERER"]) || Sinatra::Application.environment.to_s == 'development'

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