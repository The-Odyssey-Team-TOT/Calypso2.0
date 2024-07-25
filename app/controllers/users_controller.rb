class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @chatroom = session[:chatroom]
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      redirect_to root_path
    else
      render alert: "You cannot delete this user"
    end
  end

  private

  def user_params
    params.require(:chatroom).permit(:email, :password, :nickname, :description, :spoken_language, :learning_language, :photo)
  end

end
