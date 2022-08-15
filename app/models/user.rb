# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :name, presence: true

  has_one_attached :profile_image
  validate :check_image_type

  def check_image_type
    if profile_image.attached? && !profile_image.content_type.in?(%w[image/jpeg image/png image/jpg])
      errors.add(:profile_image, 'must be a JPEG or PNG')
    end
  end

  def profile_image_thumbnail
    if profile_image.attached? && profile_image.content_type.in?(%w[image/jpeg image/png image/jpg])
      profile_image.variant(resize: '60x60!').processed
    else
      '/default_profile.jpg'
    end
  end

  def to_s
    email
  end

  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
    @cart = Cart.create(user_id: id)
  end
end
