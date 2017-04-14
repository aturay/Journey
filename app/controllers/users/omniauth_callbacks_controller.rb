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
    redirect_to root_path
  end


  def find_for_vkontakte_oauth data
    url = data.info.urls.Vkontakte
    if user = User.where( :url => url ).first
      user
    else
      User.create!( :provider => data.provider,
                    :email => data.extra.raw_info.domain+'(vk.com)',
                    :password => Devise.friendly_token[0,20],
                    :username => data.info.name,
                    :url => url,
                    :nickname => data.extra.raw_info.domain)
    end
  end
end


