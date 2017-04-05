class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else
      User.create!( :provider => access_token.provider,
                    :url => access_token.info.urls.Facebook,
                    :username => access_token.extra.raw_info.name,
                    :nickname => access_token.extra.raw_info.username,
                    :email => access_token.extra.raw_info.email,
                    :password => Devise.friendly_token[0,20])
    end
  end

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
