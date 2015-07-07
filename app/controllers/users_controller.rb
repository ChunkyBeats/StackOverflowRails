class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver_now
      flash[:notice] = "Welcome to the club"
      redirect_to root_path
    else
      flash[:alert] = "That didnt work..."
      redirect_to :back
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
