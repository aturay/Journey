class Users::OmniauthCallbacksController <  Devise::OmniauthCallbacksController

  def vkontakte
    vk_data = request.env["omniauth.auth"]

    @user = User.find_for_vkontakte_oauth vk_data

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to root_path
    end
  end


  def failure
    logger.debug '========================='
    logger.debug request.env["omniauth.auth"]
    logger.debug '========================='
    redirect_to root_path
  end

end


