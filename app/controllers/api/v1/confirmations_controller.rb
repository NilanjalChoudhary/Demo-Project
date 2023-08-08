class Api::V1::ConfirmationsController < ApplicationController
  def create
    user = User.find_by_confirmation_token(params[:confirmation_token])

    if user && user.confirmation_token_valid?
      user.confirm!
      render json: { message: 'User account confirmed successfully' }
    else
      render json: { error: 'Confirmation token is invalid or expired' }, status: :unprocessable_entity
    end
  end
end