class UsersItem < ApplicationRecord
  belongs_to :User
  belongs_to :Item
end
