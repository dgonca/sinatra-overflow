 post '/questions/:id/answers' do
  if request.xhr? && logged_in?
    @question = Question.find(params[:id])
    @answer = Answer.new(content: params[:content], question_id: params[:id], author_id: current_user.id)
    if @answer.save
      erb :"/answers/_show", layout: false
    else
      @errors = @answer.errors.full_messages
    end
  else
    redirect "/sessions/new"
  end
end
