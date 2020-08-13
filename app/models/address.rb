class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Item
  belongs_to_active_hash :prefectures

  
end
