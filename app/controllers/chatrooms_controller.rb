class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatrooms = Chatroom.all
    if params[:query].present?
      @chatrooms = Chatroom.search_by_name_and_topic_and_language_and_language_level(params[:query])
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'chatrooms/rooms', locals: { chatrooms: @chatrooms }, formats: [:html] }
    end
    @wall = @chatroom.wall
    @posts = @wall.present? ? @wall.posts : []
    @post = Post.new(wall: @wall)
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
      @wall = Wall.new(chatroom: @chatroom)
      if @wall.save
        redirect_to @chatroom
      else
        render alert: "Your wall could not be created"
      end
    else
      render :new
    end
  end

  def admin
    @new_admin = User.find(params[:user_id])
    @chatroom = Chatroom.find(params[:id])
    @chatroom.user = @new_admin
    @chatroom.save!
  end

  private

  def wall_params
    params.require(:wall).permit(:chatroom_id)
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :password, :status, :language, :language_level)
  end
end
