post '/questions/:id/comments' do
  # create a new comment for a given question


end

post '/answers/:id/comments' do
  # create a new comment for an existing answer
  if request.xhr? && logged_in?
    answer = Answer.find(params[:id])
    @comment = answer.comments.create(content: params[:content], author_id: current_user.id)
    if @comment.save
      erb :"/comments/_show", layout: false
    else
      errors = @comment.errors.full_messages
    end
  else
    "something is super fucked. comment on that"
  end
end
