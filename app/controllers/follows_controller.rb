class FollowsController < ApplicationController
  # def create
  #   @user = User.find(params[:user_id])
  #   current_user.follow(@user)
  #   redirect_to @user, notice: 'You are now following this user.'
  # end

  # def destroy
  #   @user = User.find(params[:user_id])
  #   current_user.stop_following(@user)
  #   redirect_to @user, notice: 'You have unfollowed this user.'
  # end

  def follow
    @user = User.find(params[:id])
    current_user.follow @user
    redirect_to user_profile_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow @user
    redirect_to user_profile_path
  end
  
end