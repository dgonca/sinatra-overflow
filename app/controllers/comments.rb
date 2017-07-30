post '/questions/:id/comments' do
  # create a new comment for a given question
  if request.xhr? && logged_in?
    question = Question.find(params[:id])
    @comment = question.comments.create(content: params[:content], author_id: current_user.id)
    if @comment.save
      erb :"/comments/_show", layout: false
    else
      @errors = @comment.errors.full_messages
    end
  else
    redirect "/sessions/new"
  end
end

post '/answers/:id/comments' do
  # create a new comment for an existing answer
  if request.xhr? && logged_in?
    answer = Answer.find(params[:id])
    @comment = answer.comments.create(content: params[:content], author_id: current_user.id)
    if @comment.save
      erb :"/comments/_show", layout: false
    else
      @errors = @comment.errors.full_messages
    end
  else
    redirect "/sessions/new"
  end
end
