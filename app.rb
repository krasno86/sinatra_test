require 'rack/validator/sinatra'
require 'sinatra'
require 'pony'
require 'dotenv/load'
require_relative 'services/send_email'
require_relative 'services/params_validator'

get '/' do
  erb :'/messages/new'
end

post '/messages/create' do
  validator = ParamsValidator.call(params)
  if validator.has_errors?
    p validator.messages.join('|')
  else
    SendEmail.new(params).call
    redirect '/success'
  end
end

get '/success' do
  %q{Your feedback was sent successfully!<br><f><a href='/'>New feedback</a>}
end
