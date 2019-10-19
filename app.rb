require 'sinatra'
# get '/frank-says' do
#   'Put this in your pipe & smoke it!'
# end

get '/messages/new' do
  erb :'/messages/new'
  # haml '/messages/new'
end

post '/messages/create' do
  puts "PARAMS"
  p params
  puts "PARAMS"
  # p params
  # @email = parama[:email]
end
