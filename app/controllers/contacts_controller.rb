class ContactsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @contact_us = @user.contacts.new
  end

  def create
    @user = User.find(params[:user_id])
    @contact_us = @user.contacts.new( contact_params.merge( sender: current_user.name ) )
    if @contact_us.save 
      ContactMailer.send_contact_email(@contact_us).deliver_now
      redirect_to user_posts_path,  notice: 'Email sent successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 
  def contact_params
    params.require(:contact).permit(:body, :sender)
  end
end
