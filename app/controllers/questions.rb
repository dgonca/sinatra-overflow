get '/questions' do
  # show all questions

  erb :'questions/index'
end

get '/questions/new' do
  # page with form to create new question
  erb :'questions/new'
end

post '/questions' do
  # with the data that is passed in, create a new instance of question
  # should it redirect to '/questions/:id' or to '/questions' ?
end

get 'questions/:id' do
  # display page for individual question
end


