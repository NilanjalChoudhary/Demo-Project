class ApplicationController < ActionController::Base
  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :phone_number, :year_of_experience, :password, :password_confirmation, :role)
  end
end

