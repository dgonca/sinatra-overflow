get '/sessions/new' do
  # loading the login page for the user
  erb :'/sessions/new'
end

post '/sessions' do
  # creating the session with the user id
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Invalid email address and/or password. Please try again."]
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  # logging the user out
  session.delete(:user_id)
  redirect '/'
end
