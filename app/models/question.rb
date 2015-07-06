class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  has_many :answers
  belongs_to :accepted_answer, :class_name => "Answer", :foreign_key => :accepted_answer_id

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

    "asked by #{self.user.username} #{time_elapsed} #{time_unit} ago"
  end

  def self.sort_by_votes
    all.sort_by { |question| -question.vote_count } # negative sign switches order
  end

  def vote_count
    self.votes.length
  end

end
