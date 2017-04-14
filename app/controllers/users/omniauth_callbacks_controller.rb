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

  # def vk
  #   data = request.env['omniauth.auth']
  #   current_user && current_user.update_provider(data) && redirect_to(edit_user_registration_path) && return
  #   user = User.from_omniauth(data)
  #   user.persisted? ? sign_in_and_redirect(user) : redirect_to(new_user_registration_path)
  # end

  def failure
    redirect_to root_path
  end
end

# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   def vkontakte
#     # You need to implement the method below in your model (e.g. app/models/user.rb)
#     @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
#       set_flash_message(:notice, :success, :kind => "vkontakte") if is_navigational_format?
#     else
#       session["devise.facebook_data"] = request.env["omniauth.auth"]
#       redirect_to new_user_registration_url
#     end
#   end

# end