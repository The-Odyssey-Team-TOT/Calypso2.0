class UserController < ApplicationController
  before_action :set_user

  def edit
    @user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :nickname, :description, :spoken_language, :learning_language)
  end

end
