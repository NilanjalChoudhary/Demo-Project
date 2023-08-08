class Api::V1::FollowsController < ApplicationController

  def follow
    if current_user.confirm_by_admin == false
      # render partial: 'layouts/confirm_first'
      render json: { error: "Account is not confirmed by admin" }, status: 400
    else
      @user = User.find(params[:id])
      current_user.follow @user
      # redirect_to user_profile_path
      render json: { message: "followed successfully" }, status: 200
    end
  end

  def unfollow
    if current_user.confirm_by_admin == false
      # render partial: 'layouts/confirm_first'
      render json: { error: "Account is not confirmed by admin" }, status: 400
    else
      @user = User.find(params[:id])
      current_user.unfollow @user
      redirect_to user_profile_path
      render json: { message: "Unfollowed successfully" }, status: 200
    end
  end
  
end