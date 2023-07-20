class RegistrationsController < Devise::RegistrationsController

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

