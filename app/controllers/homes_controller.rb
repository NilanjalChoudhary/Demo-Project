class HomesController < ApplicationController

  # auto_session_timeout 5.seconds unless current_user.confirm_by_admin


  def index
    if user_signed_in?
      # if current_user.role == "Preciousian"
      if ["Preciousian", "Admin", "NonPreciousian"].include? current_user.role
        redirect_to user_posts_path(current_user)
      end
    end
  end
end
