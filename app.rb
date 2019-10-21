require 'sinatra'
require_relative 'models/message'
require 'pony'
require 'dotenv/load'
require 'net/smtp'

get '/messages/new' do
  erb :'/messages/new'
end

post '/messages/create' do
  Pony.mail({
    from: params[:email],
    to: ENV['ADMIN_EMAIL'],
    subject: "user #{params[:name]} feedback",
    body: params[:body],
    attachments: {params[:file][:filename] => File.read(params[:file][:tempfile])},
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
