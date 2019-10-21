require 'sinatra'
require 'sendgrid-ruby'
require_relative 'models/message'
require 'pony'
require 'dotenv/load'

get '/messages/new' do
  erb :'/messages/new'
end

post '/messages/create' do
  p '111111111111111'
  p params
  # @message = Message.new(params)

     Pony.mail({
        from: params[:email],
        to: ENV['ADMIN_EMAIL'],
        subject: "user #{params[:name]} feedback",
        body: params[:body],
        via: :smtp,
        via_options: {
            address: 'smtp.gmail.com',
            domain: 'gmail.com',
            port: '587',
            user_name: ENV['USERNAME'],
            password: ENV['PASSWORD']
        }
    })

  redirect '/messages/new'
end
