class User < ApplicationRecord
  # Фильтры pdf/image, почта на уникальность

  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :omniauthable, omniauth_providers: [:vkontakte]

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else
      User.create!( :provider => access_token.provider,
                    :url => access_token.info.urls.Vkontakte,
                    :username => access_token.info.name,
                    :nickname => access_token.extra.raw_info.domain,
                    :email => access_token.extra.raw_info.domain+'<hh user=vk>.com',
                    :password => Devise.friendly_token[0,20])
    end
  end


  has_attached_file :file,
                    url: '/system/uploads/:id.:extension',
                    path: ':rails_root/public/system/uploads/:id.:extension'

  if true # If item controller name == 'registrations' || Processing by Users::RegistrationsController#create
    validates_attachment  :file,
      # presence: true,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"] },
      size: { in: 0..1000.kilobytes }
  end
end
