class Api::V1::RegistrationsController < Devise::RegistrationsController
  
  def sign_out_and_redirect
    sign_out(current_user)
    redirect_to root_path, notice: "You have been automatically logged out due to inactivity."
  end
  # def follow
  #   byebug
  #   @user = User.find(params[:id])
  #   current_user.follow(@user)
  #   redirect_to user_profile_path 
  # end

  def follow  
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @user = User.find(params[:id])
      current_user.follow(@user)
      # @user.accept_follow_request_of(current_user)
      redirect_to user_profile_path( @user.id, @user.profile.id )
    end
  end

  def unfollow
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @user = User.find(params[:id])
      current_user.unfollow(@user)
      redirect_to user_profile_path( @user.id, @user.profile.id )
    end
  end

  def accept
    @user = User.find(params[:id])
    current_user.accept_follow_request_of(@user)
  end

  def cancel
    @user = User.find(params[:id])
    current_user.remove_follow_request_for(@user)
  end

  private
#   def sign_up_params
#     params.require(:user).permit(:name, :age, :email, :role, :type, :phone_number, :year_of_experience, :password, :password_confirmation)
#   end

#   def user_update_params
#     params.require(:user).permit(:name, :phone_number, :age, :year_of_experience, :email, :role, :password, :current_password)
#   end
# end


  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :role, :type)
  end
  def account_update_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :current_password, :role, :type)
  end
end

