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
