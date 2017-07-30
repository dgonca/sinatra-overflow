post "/questions/:id/votes" do
  @question = Question.find_by(id: params[:id])
  if request.xhr? && @question
    if !logged_in? || Vote.already_voted?(@question, current_user.id)
      status 401
    else
      vote = @question.votes.create(user_id: current_user.id, value: params[:value].to_i)
      if vote.persisted?
        @question.score.to_s
      else
        "Can't vote twice"
      end
    end
  end

end

# TODO: Prevent a user from voting on something more than once