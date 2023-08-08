class Api::V1::CommentsController < ApplicationController
  
  load_and_authorize_resource

  def index    
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render json: @comments
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new()
    # render json: @comment
  end

  def create
    @post = Post.find(params[:post_id])
    # @comment = current_user.posts.find(params[:post_id]).comments.new(comment_params)
    @comment = @post.comments.new(comment_params.merge(commenter: current_user.name))

    if @comment.save 
      # redirect_to user_post_comments_path
      render json: { message: "Post successfully created" }, status: 200
    else
      # render :new, status: :unprocessable_entity
      render json: { error:"unable to create Post" }, status: 400
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      render json: { message: "POst successfully created" }, status: 200
    else
      render json: { error: "unable to delete Post" }, status: 400    
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :comment)
  end 
end
