class ContactsController < ApplicationController
  def new
    if current_user.role == "NonPreciousian"
      if current_user.confirm_by_admin == false
        render partial: 'layouts/confirm_first'
      else
      @user = User.find(params[:user_id])
      @contact_us = @user.contacts.new
      end
    else
      redirect_to user_posts_path
    end
  end

  def create
    if current_user.confirm_by_admin == false 
      render partial: 'layouts/confirm_first'
    else
      @user = User.find(params[:user_id])
      @contact_us = @user.contacts.new( contact_params.merge( sender: current_user.name ) )
      if @contact_us.save 
        ContactMailer.send_contact_email(@contact_us).deliver_now
        redirect_to user_posts_path,  notice: 'Email sent successfully.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private 
  def contact_params
    params.require(:contact).permit(:body, :sender)
  end
end
