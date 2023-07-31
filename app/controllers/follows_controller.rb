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
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
    @user = User.find(params[:id])
    current_user.follow @user
    redirect_to user_profile_path
    end
  end

  def unfollow
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
    @user = User.find(params[:id])
    current_user.unfollow @user
    redirect_to user_profile_path
    end
  end
  
end