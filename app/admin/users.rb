ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :name, :phone_number, :age, :year_of_experience, :role, :confirm_by_admin


  controller do
    def ransack_params
      # Only allow searching on non-association fields
      params[:q].permit(:id, :name, :email) # Add any other non-association fields you want to allow searching on
    end
  end
  
  controller do
    def ransackable_associations(auth_object = nil)
      []
    end
  end

  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :name, :phone_number, :age, :year_of_experience, :role, :type, :confirm_by_admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



end
