# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  include RackSessionsFix
  
  respond_to :json
  
  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end


  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  #------------------------------------------------test-------------------------------------

  def sign_out_and_redirect
    sign_out(current_user)
    redirect_to root_path, notice: "You have been automatically logged out due to inactivity."
  end

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

  private
#   def sign_up_params
#     params.require(:user).permit(:name, :age, :email, :role, :type, :phone_number, :year_of_experience, :password, :password_confirmation)
#   end

#   def user_update_params
#     params.require(:user).permit(:name, :phone_number, :age, :year_of_experience, :email, :role, :password, :current_password)
#   end
# end


  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :role, :type, :jti)
  end
  def account_update_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :current_password, :role, :type)
  end

end
