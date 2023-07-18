class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    # @post = 
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def post_params
    params.require(:post).permit(:title)
  end
end
