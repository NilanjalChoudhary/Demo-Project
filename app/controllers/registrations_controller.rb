class RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:user).permit(:name, :age, :email, :role, :phone_number, :year_of_experience)
  end
end