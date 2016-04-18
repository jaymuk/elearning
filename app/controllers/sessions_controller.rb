class SessionsController < Devise::SessionsController
  
  def create
    user = warden.authenticate!(auth_options)
    token = Tiddle.create_and_return_token(user, request)
    render json: { authentication_token: token }
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    respond_with sign_out
  end

  private
  
    def verify_signed_out_user
    end

end