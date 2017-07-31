get '/' do
  redirect "/questions"
end


get '/about' do 
	erb :about
end