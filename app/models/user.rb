class User < ApplicationRecord
  # Фильтры pdf/image, почта на уникальность

  devise  :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :omniauthable, omniauth_providers: [:vkontakte]

  has_attached_file :file,
                    url: '/system/uploads/:id.:extension',
                    path: ':rails_root/public/system/uploads/:id.:extension'

  if true # If item controller name == 'registrations' || Processing by Users::RegistrationsController#create
    validates_attachment  :file,
      # presence: true,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"] },
      size: { in: 0..1000.kilobytes },
      default_url: nil
  end

  def self.find_for_vkontakte_oauth data
    url = data.info.urls.Vkontakte

    if user = User.where( :url => url ).first
      user
    else
      email = data.info.email || data.uid + '@' + data.provider + '.com'

      user = User.create!(
        :username => data.info.name,
        :email => email,
        # :phone => '',
        :city => data.extra.raw_info.city.title,
        :password => Devise.friendly_token[0,20],
        :url => url,
        :provider => data.provider,
        :credentials => 'social')

      ActionCable.server.broadcast('user', user: user )

      user
    end
  end
end
