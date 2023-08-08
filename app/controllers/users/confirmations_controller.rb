# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController

  respond_to :json

    def show
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?
  
      if resource.errors.empty?
        # Generate JWT and return it in the response
        token = JWT.encode({ user_id: resource.id }, Rails.application.credentials.secret_key_base)
        render json: { token: token, message: 'Account confirmed successfully.' }
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
