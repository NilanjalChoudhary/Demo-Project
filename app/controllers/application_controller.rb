class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :authenticate_user!

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
end

