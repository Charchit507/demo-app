class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    pass = Devise.friendly_token[0,20]
    Rails.logger.debug ">>>password:- #{pass}"
    user = User.find_by(email: access_token.info.email)
    unless user
      user = User.create(
        email: access_token.info.email,
        password: pass,
      )
    end
    user.first_name = access_token.info.first_name
    user.last_name = access_token.info.last_name
    user.image = access_token.info.image
    # user.uid = access_token.uid
    # user.provider = access_token.provider
    user.save

    user
  end
end
