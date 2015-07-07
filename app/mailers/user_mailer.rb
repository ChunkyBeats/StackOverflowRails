class UserMailer < ApplicationMailer
  default from: "crbi2550@gmail.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: ">>Signup Confirmation!<<"
  end
end
