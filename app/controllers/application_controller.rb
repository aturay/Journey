class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      unless request.fullpath == '/users/sign_in' || request.fullpath == '/users/sign_up'
        redirect_to new_user_session_path, notice: 'if you want to add a notice'
      end
    end
  end
end
