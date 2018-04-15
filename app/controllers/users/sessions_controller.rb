module Users
  class SessionsController < Devise::SessionsController
    respond_to :json, only: :create

    def create
      resource = User
        .find_for_database_authentication email: sign_in_params[:email]
      if resource && resource.valid_password?(sign_in_params[:password])
        set_flash_message! :notice, :signed_in
        sign_in :user, resource
        return
      end
      invalid_login
    end

    private

    def invalid_login
      set_flash_message :alert, :invalid_signin
      render json: {message: flash[:alert]}, status: :unauthorized
    end
  end
end
