get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do

  erb :'/users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  # set the session id and start session
  end
end
