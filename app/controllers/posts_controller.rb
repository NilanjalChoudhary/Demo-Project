class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    # @post = 
  end
  
  def new
    @post = current_user.posts.new
  end

  def create
    # @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    # @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path
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
    params.require(:post).permit(:title, :body, :image, pictures: [])
  end
end
