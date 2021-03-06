# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :customers
  has_many :consultations
  has_many :tickets
  has_many :plan_payments
  has_many :attestations
  has_many :receipts

  before_create :build_token

  validates :name, presence: true

  self.per_page = 25

  include PgSearch
  pg_search_scope :search, against: %i[name celphone cpf],
                           using: {
                             tsearch: { prefix: true }
                           }

  def build_token
    self.token = SecureRandom.hex(6)
  end

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
