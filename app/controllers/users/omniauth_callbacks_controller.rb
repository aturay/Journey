class Users::OmniauthCallbacksController <  Devise::OmniauthCallbacksController

  def vkontakte
    @user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

end

# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   include Devise::Controllers::Rememberable

#   def vkontakte
#     @user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
#     if @user.persisted?
#       remember_me(@user)
#       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
#       sign_in_and_redirect @user, :event => :authentication
#     else
#       flash[:notice] = "authentication error"
#       redirect_to root_path
#     end
#   end

#   def passthru
#     super
#   end
# end