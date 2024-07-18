class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.user
      @chatroom.update(chatroom_params)
      redirect_to chatroom_path(@chatroom)
    else
      render alert: "You are not allowed to edit the chatroom"
    end
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      render :new
    end
  end
    # def ban
    #   @user_to_ban = User.find(params[:user_id])
    #   @chatroom = Chatroom.find(params[:id])

    #   if @chatroom && @user_to_ban
    #     @chatroom.user.delete(@user_to_ban)
    #   end
    # end
    
  def admin
    @new_admin = User.find(params[:user_id])
    @chatroom = Chatroom.find(params[:id])
    @chatroom.user = @new_admin
    @chatroom.save!
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :description)
  end

end
