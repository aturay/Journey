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
      size: { in: 0..1000.kilobytes }
  end
end
