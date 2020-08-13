class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Item
  belongs_to_active_hash :prefectures

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :phone_number, length: { maximum: 11, message: "Phone number is invalid."  }
  validates :prefectures, numericality: { other_than: 1, message: "can't be blank" }

end
