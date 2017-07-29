class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def self.already_voted?(voteable, user_id)
    voteable.votes.pluck(:user_id).include?(user_id)
  end
end
