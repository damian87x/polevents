class ApplicationController < ActionController::API
  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    responder = AuthResponder.new(self)
    if responder.sucess?
      responder.respond
    else
      authentication_error
    end
  end

  private


  def authentication_error
    render json: {error: t('devise.failure.unauthenticated')}, status: 401
  end

end
