class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :price

  end

  export PAYJP_SECRET_KEY='sk_test_XXXXXXXXXXXX'
  export PAYJP_PUBLIC_KEY='pk_test_XXXXXXXXXXXX'
  

end
