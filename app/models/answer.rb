class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  def description
    time_elapsed = (Time.now - self.created_at).to_i
    if time_elapsed < 60
      time_unit = "seconds"
    elsif time_elapsed < 3600
      time_unit = "minutes"
      time_elapsed = (time_elapsed/60).to_i
    else
      time_unit = "hours"
      time_elapsed = (time_elapsed/3600).to_i
    end

    "answered by #{self.user.username} #{time_elapsed} #{time_unit} ago"
  end

end
