get '/questions' do
  # show all questions
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    redirect "/sessions/new"
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

post '/questions' do
  new_question = current_user.questions.create(params[:question])
  if new_question.persisted?
    redirect "/questions/#{new_question.id}"
  else
    @errors = new_question.errors.full_messages
    erb :'/questions/new'
  end
end


