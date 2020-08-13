class ItemTransaction
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :item_id, :user_id, :price, :token, :postal_code, :prefectures_id, :city, :address_line1, :address_line2, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid."}
  end
  validates :phone_number, length: { maximum: 11, message: "Phone number is invalid."  }
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    Transaction.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, item_id: item_id)
  end
end