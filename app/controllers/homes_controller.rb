class HomesController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == "Preciousian"
        redirect_to user_posts_path(current_user)
      end
    end
  end
end
