class Answer < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable

end