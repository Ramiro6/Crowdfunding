class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_path)

    if @user.save
      redirect_to "/save"
    end
  end

  private
  def user_path
    params.require(:user).permit(:name, :email, :password)
  end
end
