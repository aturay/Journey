class User < ApplicationRecord
  # Фильтры pdf/image, почта на уникальность

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else
      User.create!( :provider => access_token.provider,
                    :url => access_token.info.urls.Vkontakte,
                    :username => access_token.info.name,
                    :nickname => access_token.extra.raw_info.domain,
                    :email => access_token.extra.raw_info.domain+'@vk.com',
                    :password => Devise.friendly_token[0,20])
    end
  end

end
