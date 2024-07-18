class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id]sm
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      render :new
    end



    # def ban
    #   @user_to_ban = User.find(params[:user_id])
    #   @chatroom = Chatroom.find(params[:id])

    #   if @chatroom && @user_to_ban
    #     @chatroom.user.delete(@user_to_ban)
    #   end
    # end

    def admin
      @new_admin = User.find(params[:id])
      @chatroom = Chatroom.find(params[:id])
      @chatroom.user = @new_admin
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :description)
  end

end
