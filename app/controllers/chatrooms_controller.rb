class ChatroomsController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
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
