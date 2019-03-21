# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  before_create :build_token

  validates :first_name, :last_name, presence: true

  def build_token
    self.token = SecureRandom.hex(6)
  end

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = auth['info']['email']
      user.name = auth['info']['name']
      user.password = Devise.friendly_token[0, 20]
      # user.image = auth.info.image
    end
  end
end
