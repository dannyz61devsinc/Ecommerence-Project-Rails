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

  has_one_attached :profile_image

  def profile_image_thumbnail
    if profile_image.attached?
      profile_image.variant(resize: '60x60!').processed
    else
      '/default_profile.jpg'
    end
  end
end
