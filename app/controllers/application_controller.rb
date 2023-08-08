class ApplicationController < ActionController::Base
  
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # auto_session_timeout 5.seconds unless current_user.confirm_by_admin

  # before_action :check_user

  # def check_user
  #   # sign_out_path if current_user and current_user.confirm_by_admin
  #   redirect_to "sign_out" if current_user and current_user.confirm_by_admin
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :role)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

end

