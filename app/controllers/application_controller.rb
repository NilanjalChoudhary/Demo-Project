class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :role)
  end
end

