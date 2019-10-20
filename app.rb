require 'sinatra'
require_relative 'models/message'

get '/messages/new' do
  erb :'/messages/new'
  # haml '/messages/new'
end

post '/messages/create' do
  p params
  p @message = Message.new(params)
end


