class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :category

  end

  has_many :Users_items
  has_one :Address
  has_many :Users, through: :Users_items
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :day_until_shipping
  
  # validates :category, numeracality: {other_than:0} do
  
end
