class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, :class_name => "User"
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

end
