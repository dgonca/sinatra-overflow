get '/sessions/new' do
  # loading the login page for the user

  erb :'/sessions/new'
end

post '/sessions' do
  # creating the session with the user id

  redirect '/'
end

delete '/sessions' do
  # logging the user out

  redirect '/'
end
