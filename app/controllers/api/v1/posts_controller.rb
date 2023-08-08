class Api::V1::PostsController < ApplicationController

  load_and_authorize_resource

  # respond_to :js, :html, :json

  def index
    if current_user.confirm_by_admin == false
      # render partial: 'layouts/confirm_first'
      render json: { error: "not confirmed by admin" }, status: 400
    else
      if current_user.role == "NonPreciousian"
        @posts = Post.where(post_for: "NonPreciousian")
        render json: @posts
      else
        @posts = Post.all.paginate(page: params[:page], per_page: 3)
        render json: @posts
      end
    end
  end

  def show
    if current_user.confirm_by_admin == false
      # render partial: 'layouts/confirm_first'
      render json: { error: "not confirmed by admin" }, status: 400
    else
      @user = User.find(params[:user_id])
      render json: @user
    end
  end
  

  def new
    if current_user.confirm_by_admin == false 
      # render partial: 'layouts/confirm_first'
      render json: { error: "not confirmed by admin" }, status: 400

    elsif current_user.role == "NonPreciousian"
      # redirect_to user_posts_path, notice: "You are not allowed to create post"
      render json: { error: "Not allowed to create" }, status: 400

    elsif current_user.profile.present? == false
      # redirect_to new_user_profile_path(current_user), notice: "Please Create Profile First."
      render json: { error: "Create Your Profile first" }, status: 400
    else
      @post = current_user.posts.new
      render json: @post
    end
  end

  def create
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @post = current_user.posts.new(post_params)
      if @post.save
        # redirect_to user_posts_path
        # flash[:success] = 'Post was successfully created.'
        render json: { message: "Post successfully Created" }, status: 200
      else
        # render :new, status: :unprocessable_entity
        render json: { error: "unable to create Post" }, status: 400
      end
    end
  end

  def like
    @post = Post.find(params[:id])  
    @post.liked_by current_user
    # redirect_to user_posts_path(Post.all)
    render json: { message: "Successfully liked" }
  end

  def unlike
    @post = Post.find(params[:id])  
    @post.unliked_by current_user
    # redirect_to user_posts_path(Post.all)
    render json: { message: "Successfully Unliked" }

  end

  def edit
  end

  def update
  end

  def destroy
    # byebug
    @post = User.find(params[:user_id]).posts.find(params[:id])
    if @post.destroy 
      # redirect_to user_posts_path, notice: "successfully deleted"
      render json: { message: "Successfully destroy" }, status: 200
    else
      # redirect_to user_posts_path, alert: "Failed to delete"
      render json: { error: "Unable to destroy" }, status: 400
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :post_for, pictures: [])
  end
end
