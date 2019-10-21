require 'sinatra'
require 'pony'
require 'dotenv/load'

get '/' do
  erb :'/messages/new'
end

post '/messages/create' do
  if params[:name].empty? || params[:email].empty? || params[:body].empty?
    redirect '/'
  else
    attachments = params[:file] ? {params[:file][:filename] => File.read(params[:file][:tempfile])} : ''
    Pony.mail({
      from: params[:email],
      to: ENV['ADMIN_EMAIL'],
      subject: "user #{params[:name]} feedback",
      body: params[:body],
      attachments: attachments,
      via: :smtp,
      via_options: {
        address: 'smtp.gmail.com',
        domain: 'gmail.com',
        port: '587',
        user_name: ENV['USERNAME'],
        password: ENV['PASSWORD']
      }
    })
    redirect '/success'
  end
end

get '/success' do
  %q{Your feedback was sent successfully!<br><f><a href='/'>New feedback</a>}
end
