class User < ActiveRecord::Base
  attr_accessor :password
  has_many :questions
  validates_confirmation_of :password
  before_save :encrypt_password
  has_many :votes, as: :votable
  has_many :answers

  validates :username, :presence => true

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def upvoted_question?(question)
    Vote.exists?(user_id: self.id, votable_id: question.id, votable_type: "Question")
  end

  def upvoted_answer?(answer)
    Vote.exists?(user_id: self.id, votable_id: answer.id, votable_type: "Answer")
  end

end
