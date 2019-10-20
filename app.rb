# require 'rack/validator/sinatra'
require 'sinatra'
require_relative 'models/message'
# require 'rack/validator'

get '/messages/new' do
  erb :'/messages/new'
  # haml '/messages/new'
end

post '/messages/create' do
  @message = Message.new(params)
end
# validator = Rack::Validator.new(params)
#
# validation_required :POST, '/messages/create', params: [
#     { name: :name, required: true, range: [ 3, 250 ] },
#     { name: :email, type: :email, required: true, matches: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
#     { name: :message, range: [ 1, 50 ] }
# ]
