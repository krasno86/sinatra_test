require 'rack/validator/sinatra'
require 'sinatra'
require 'pony'
require 'dotenv/load'
require_relative 'services/send_email'

get '/' do
  erb :'/messages/new'
end

post '/messages/create' do
  validator = Rack::Validator.new(params, true)
  validator.required [:name, :email, :body]
  validator.downcase :email
  validator.is_in_range 10, 32, :name
  validator.is_email :email
  validator.matches /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :email
  validator.is_greater_equal_than 50, :body

  if validator.has_errors?
    p validator.messages.join('|')
  else
    SendEmail.new(params).perform
    redirect '/success'
  end
end

get '/success' do
  %q{Your feedback was sent successfully!<br><f><a href='/'>New feedback</a>}
end
