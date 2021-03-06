class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :day_until_shipping_id
  end

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 40 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  has_one_attached :images

  has_many :transactions
  has_one :address
  has_many :users, through: :transactions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :day_until_shipping
end
