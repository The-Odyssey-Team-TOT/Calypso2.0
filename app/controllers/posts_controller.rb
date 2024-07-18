class PostsController < ApplicationController
  before_action :set_wall
  before_action :set_user

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    # @post.wall = @wall
    if @post.save
      redirect_to wall_path(@wall)
    else
      render alert: "Your post could not be sent"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user
      @post.update(posts_params)
      redirect_to wall_path(@wall)
    else
      render alert: "You cannot modify this post"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user
      @post.destroy
      redirect_to wall_path(@wall)
    else
      render alert: "You cannot delete this post"
  end

  private

  def set_wall
    @wall = Wall.find(params[:wall_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def posts_params
    @post =  params.require(:posts).permit(:content, :wall_id, :user_id)
  end

end
