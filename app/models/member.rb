class Member < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  # def ban
  #   @user = User.find(params[:user_id])
  #   @chatroom = Chatroom.find(params[:chatroom_id])
  #   @user.member.banned
  #   if @chatroom.user
  # end
end
