class CommentsController < ApplicationController
  load_and_authorize_resource


  def index
    # if Post.find(params[:post_id]).comments.count == 0
      
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    # @Comments = @post.comments
  end

  def new
    # @user = current_user
    # @post = @user.posts.find(params[:id])

    @post = Post.find(params[:post_id])
    # @comment = current_user.posts.find(params[:post_id]).comments.new()
    @comment = @post.comments.new()
  end

  def create
    # @user = User.find(params{:id})
    # @user = current_user
    # @post = @user.posts.find(params[:id])

    @post = Post.find(params[:post_id])
    # @comment = current_user.posts.find(params[:post_id]).comments.new(comment_params)
    @comment = @post.comments.new(comment_params.merge(commenter: current_user.name))

    if @comment.save 
      redirect_to user_post_comments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :comment)
  end 
end
