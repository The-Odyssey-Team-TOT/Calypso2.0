class WallsController < ApplicationController
  before_action :set_chatroom

  def show
    @wall = Wall.find(params[:chatroom_id])
  end

  private

  def set_room
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
