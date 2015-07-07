require "rails_helper"
require "spec_helper"

describe User do
  it { should validate_presence_of :username }
  it { should have_many :questions}

  it "has a password hash and password salt" do
    user = FactoryGirl.create(:user)
    expect(User.find(user.id).password_hash.nil?).to eq(false)
    expect(User.find(user.id).password_salt.nil?).to eq(false)
  end

  describe ".authenticate" do
    it "returns the user with username and password if such user exists" do
      user = FactoryGirl.create(:user)
      expect(User.authenticate(user.username, user.password)).to eq(user)
    end

    it "is nil if there's no user with the username" do
      user = FactoryGirl.create(:user)
      expect(User.authenticate('bencorn1', 'somechars')).to eq(nil)
    end

    it "is nil if the password is wrong" do
      user = FactoryGirl.create(:user)
      expect(User.authenticate('bencorn', 'somechar')).to eq(nil)
    end
  end

end
