class ChatroomsController < ApplicationController
  before_action :set_chatroom, except: [:new, :create, :whisper]

  def show
    @notification = Notification.new
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @users = @chatroom.users
    # if @chatroom.status == "private"
    #   current_user.chatroom.password == @chatroom.password
    # end
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
      if @chatroom.user_id == current_user.id
        @chatroom.update(chatroom_params)
        redirect_to chatroom_path(@chatroom)
      else
        render :edit
      end
  end



  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user_id = current_user.id
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

  def invite
    @chatroom = Chatroom.find(params[:id])
  end

  def send_invite
    @chatroom = Chatroom.find(params[:id])
    email = params[:email]
    User.invite!(email: email) do |user|
      if user.save
        if user.chatrooms << @chatroom
          redirect_to @chatroom
        else
          render :invite
        end
      end
    end
  end

  def admin
    @new_admin = User.find(params[:user_id])
    @chatroom = Chatroom.find(params[:id])
    @chatroom.user = @new_admin
    @chatroom.save!
  end

  def whisper
    @message = Message.new
    @chatroom = Chatroom.find(params[:chatroom_id])
    @user = User.find(params[:id])
    if @user && current_user
      @chatroom_whisper = Chatroom.new(
        name: @chatroom.name,
        status: @chatroom.status,
        language: @chatroom.language,
        language_level: @chatroom.language_level,
        user_id: current_user
        )
      if @chatroom_whisper.save
        @chatroom_whisper.chatroom_memberships.create!(user: @user)
        @chatroom_whisper.chatroom_memberships.create!(user: current_user)
      # else
      #   alert: "The whisper room could not be created"
      redirect_to chatroom_path(@chatroom_whisper)
      end
    end
  end

  def show_users
    @chatroom
    @users = @chatroom.users
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end


  def wall_params
    params.require(:wall).permit(:chatroom_id)
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :password, :status, :topic, :language, :language_level, :user_id)
  end
end
