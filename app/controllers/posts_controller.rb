class PostsController < ApplicationController

  # respond_to :js, :html, :json

  def index
    @posts = Post.all

  end

  def show
    @user = User.find(params[:user_id])
    # @post = 
  end
  
  # def upvote
  #   @post = Post.find([params[:post_id]])
  #   @post.liked_by current_user
  # end

  def new
    @post = current_user.posts.new
  end

  def create
    # @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    # @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path
      flash[:success] = 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def like_the_post
  #   @post = Post.find(params[:post_id])
  #   current_user.upvote(post)
  #   redirect_to user_posts_path, notice: "Liked the post"
  # end

  # def unlike_the_post
  #   @post = Post.find(params[:post_id])
  #   if current_user.voted_for?(@post)
  #     current_user.unvote_for(@post)
  #     redirect_to user_posts_path, notice: "Like removed"
  #   else
  #     redirect_to @post, alert: "You haven't liked the pot yet"
  #   end
  # end

  # def like
  #   @post = Post.find(params[:post_id])
  #   # if params[:format] == "like"
  #   if current_user.liked? @post
  #     @post.unliked_by current_user
  #   else
  #     @post.liked_by current_user
  #   end
  #   redirect_to user_post_path
  # end

  def like
    @post = Post.find(params[:post_id])  
    @post.liked_by current_user
    # @post.upvote_by current_user
    redirect_to user_posts_path
    # respond_to do |format|
    #   format.html {redirect_back fallback_location: root_path}
    #   format.js  {render layout:false}
    # end
  end

  def unlike
    @post = Post.find(params[:post_id])  
    @post.unliked_by current_user
    # @post.unvote_by current_user
    redirect_to user_posts_path

    # respond_to do |format|
    #   format.html {redirect_back fallback_location: root_path}
    #   format.js {render layout:false}
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, pictures: [])
  end
end
