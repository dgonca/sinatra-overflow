post "/questions/:id/votes" do
  @question = Question.find_by(id: params[:id])
  if request.xhr? && @question
    # TODO: Prevent non-logged in users from voting (it throws a 500 server error)
    # TODO: Prevent a user from voting on something more than once
    p params[:value].to_i
    vote = @question.votes.create(user_id: current_user.id, value: params[:value].to_i)
    # p vote.persisted?
    @question.score.to_s
  end

end
