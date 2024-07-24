class WallsController < ApplicationController
  before_action :set_chatroom


  def create
    @wall = Wall.new(wall_params)
  end

  private


  def wall_params
    params.require(:wall).permit(:chatroom_id)
  end

  def set_room
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
