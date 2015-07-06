class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable

  def description
    "asked by #{self.user.username} #{(Time.now - self.created_at).to_i} seconds ago"
  end
end
