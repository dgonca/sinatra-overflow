helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def time_since_creation(method)
    ((Time.now - method.created_at) / 3600).round
  end

end
