get '/questions' do
  # show all questions
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  # page with form to create new question
  erb :'questions/new'
end

get 'questions/:id' do
  # display page for individual question
  erb :'questions/show'
end

post '/questions' do
  # with the data that is passed in, create a new instance of question
  # should it redirect to '/questions/:id' or to '/questions' ?
  redirect "/questions/:id"
end


