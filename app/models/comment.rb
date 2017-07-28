class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :commentable, polymorphic: true

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
