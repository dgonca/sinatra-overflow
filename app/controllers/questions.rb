get '/questions' do
  "What?"
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

get '/questions/:id' do
  "Hi"# display page for individual question
end

post '/questions/:id/answers' do
  if request.xhr? && logged_in?
    @answer = Answer.new(content: params[:content], question_id: params[:id], author_id: current_user.id)
    if @answer.save
      erb :"/questions/show", layout: false
    else
      errors = @answer.errors.full_messages
    end
  else
    "something is fucked up"
  end
end


