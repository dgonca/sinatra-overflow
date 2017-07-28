get '/questions' do
  # show all questions
  # on the board we wrote this route as "/questions/index"
  # erb:'questions/show'
end

get '/questions/new' do
  # page with form to create new question
end

post '/questions' do
  # with the data that is passed in, create a new instance of question
  # should it redirect to '/questions/:id' or to '/questions' ?
end

get 'questions/:id' do
  # display page for individual question
end


