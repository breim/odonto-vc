# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  before_save :build_cpf


  self.per_page = 25

  include PgSearch
  pg_search_scope :search, against: %i[name celphone cpf],
                           using: {
                             tsearch: { prefix: true }
                           }

  def build_cpf
    return false if cpf.nil?

    cpf.gsub!(/\D/, '')
  end

  has_attached_file :image,
                    styles: {
                      large: '512x512#', medium: '200x200#',
                      thumb: '100x100#'
                    },
                    hash_secret: ENV['paperclip_secret'],
                    url: '/images/customers/:hash.:extension',
                    path: ':rails_root/public/images/customers/:hash.:extension',
                    default_url: :set_default_url
  validates_attachment_content_type :image, content_type: /image/
  validates_attachment_size :image, less_than: 30.megabytes

  def set_default_url
    ENV['AWS_CDN_URL'].to_s + '/missing_customer.png'
  end

  def image_path(style)
    ENV['AWS_CDN_URL'].to_s + image(style.to_sym).split('/images/').last
  end

  protected

  def decode_base64_image
    return false if image_base64 == ''
    image = Paperclip.io_adapters.for(image_base64)
    image.original_filename = 'webcam.png'
    self.image = image
  end
end
