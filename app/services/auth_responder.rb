class AuthResponder

  attr_reader :respond

  def initialize(controller)
    @controller = controller
    @token = to_token
    @user_id = nil
    @respond = nil
    @sucess =false
    authenticate_with_auth_token @token
  end

  def sucess?
    @sucess
  end

  private

  def to_token
    request.headers['Authorization'] || request.headers['rack.session']['Authorization']
  end

  def authenticate_with_auth_token auth_token
    @user_id = auth_token.split(':').first
    user = find_user
    if user && Devise.secure_compare(user.id, auth_token)
      @sucess = true
      @respond = sign_in user, store: false
    else
      @sucess = false
    end
  end

  def find_user
    User.where(id: @user_id).first
  end


  def method_missing(m, *args, &block)
    if @controller.respond_to?(m)
      @controller.send(m, *args, &block)
    else
      super(m, *args, &block)
    end
  end


end