class ItemTransaction
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address_line1, :address_line2, :phone_number, :price, :token


end