class Question < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :answers
  #has_one :best_answer, through: :answers, source: :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :best_answer, :class_name => "Answer"

  validates :author, :title, :content, presence: true

  def score
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
