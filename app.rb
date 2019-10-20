require 'sinatra'
require_relative 'models/message'

get '/messages/new' do
  erb :'/messages/new'
end

post '/messages/create' do
  @message = Message.new(params)
end
