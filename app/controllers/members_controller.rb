class MembersController < ApplicationController
  before_action :set_chatroom
  before_action :set_user
  
  # def ban
  #   @member = User.find(params[:user_id])

  #   if @member.banned = true
  #     @chatroom.member.delete
  #   end
  # end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def member_params
    @member =  params.require(:members).permit(:banned, :chatroom_id, :user_id)
  end
end
