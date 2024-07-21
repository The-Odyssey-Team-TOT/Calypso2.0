class PostsController < ApplicationController
  before_action :set_wall

  # def new
  #   @post = Post.new
  # end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    @post.wall = @wall
    if @post.save
      redirect_to chatroom_path(params[:chatroom_id])
    else
      flash[:alert] = "Your post could not be sent."
      redirect_to chatroom_path(params[:chatroom_id])
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user
      @post.update(posts_params)
      redirect_to chatroom_path(@chatroom)
    else
      render alert: "You cannot modify this post"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user
      @post.destroy
      redirect_to chatroom_path(@chatroom)
    else
      render alert: "You cannot delete this post"
    end
  end

  private

  def set_wall
    @wall = Wall.find(params[:wall_id])
  end

  def posts_params
    @post = params.require(:post).permit(:content, :wall_id, :user_id)
  end

end
