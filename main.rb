require 'rubygems'
require "bundler/setup"
require 'sinatra'
require 'json'

configure :production do
  require 'newrelic_rpm'
end


get '/' do
  @allowed_hosts = ENV["ALLOWED_HOSTS"].split(",") rescue []
  @referer = request.env["HTTP_REFERER"].match(/http(?:s)?:\/\/(.*?)\/(.*?)/) rescue []
  return 403 unless @allowed_hosts.include?(@referer[1]) || Sinatra::Application.environment.to_s == 'development'

  content_type :json
  @data = JSON.dump({ip: request.ip})

  params[:callback].nil? ? @data : "#{params[:callback]}(#{@data});"
end