class PostsController < ApplicationController

  load_and_authorize_resource

  # respond_to :js, :html, :json

  def index
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      if current_user.role == "NonPreciousian"
        return @posts = Post.where(post_for: "NonPreciousian")
      else
        return @posts = Post.all.paginate(page: params[:page], per_page: 3)
      end
    end
  end

  def show
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @user = User.find(params[:user_id])
    end
  end
  

  def new
    if current_user.confirm_by_admin == false 
      render partial: 'layouts/confirm_first'
    elsif current_user.role == "NonPreciousian"
      redirect_to user_posts_path, notice: "You are not allowed to create post"
      # format.html { redirect_to user_posts_path(current_user), notice: 'You are not allowed to create post' }

    elsif current_user.profile.present? == false
      redirect_to new_user_profile_path(current_user), notice: "Please Create Profile First."
    else
      @post = current_user.posts.new
    end
  end

  def create
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
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
  end

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
    @post = Post.find(params[:id])  
    @post.liked_by current_user
    redirect_to user_posts_path(Post.all)
  end

  def unlike
    @post = Post.find(params[:id])  
    @post.unliked_by current_user
    redirect_to user_posts_path(Post.all)

  end

  def edit
  end

  def update
  end

  def destroy
    # byebug
    @post = User.find(params[:user_id]).posts.find(params[:id])
    if @post.destroy 
      redirect_to user_posts_path, notice: "successfully deleted"
    else
      redirect_to user_posts_path, alert: "Failed to delete"
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :post_for, pictures: [])
  end
end
