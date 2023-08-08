class Api::V1::ContactsController < ApplicationController
  def new
    if current_user.role == "NonPreciousian"
      if current_user.confirm_by_admin == false
        render partial: 'layouts/confirm_first'
      else
        @user = User.find(params[:user_id])
        @contact_us = @user.contacts.new
        render json: @contact_us
      end
    else
      redirect_to user_posts_path
      render json:{ error: "User is not NonPreciousian" }
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
        # redirect_to user_posts_path,  notice: 'Email sent successfully.'
        render json: { message: "Email successfully sent" }, status: 200
      else
        # render :new, status: :unprocessable_entity
        render json: { error: "Unable to send email" }, status: 400
      end
    end
  end

  private 
  def contact_params
    params.require(:contact).permit(:body, :sender)
  end
end
