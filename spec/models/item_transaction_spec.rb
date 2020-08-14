require 'rails_helper'

RSpec.describe ItemTransaction, type: :model do
  describe '#create' do
    before do
      @item_transaction = FactoryBot.build(:item_transaction)
    end
    it '郵便番号が必須であること' do
      @item_transaction.postal_code = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンが必要であること(124-4567となる)' do
      @item_transaction.postal_code = "1234567"
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が必須であること' do
      @item_transaction.prefectures_id = 1
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Prefectures can't be blank")
    end
    it '市区町村が必須であること' do
      @item_transaction.city = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("City can't be blank")
    end
    it '番地が必須であること' do
      @item_transaction.address_line1 = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Address line1 can't be blank")
    end
    it '電話番号が必須であること' do
      @item_transaction.phone_number = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @item_transaction.phone_number = "090-1234-5678"
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Phone number is invalid.", "Phone number Phone number is invalid.")
    end
    it "item_idが空では登録できないこと" do
      @item_transaction.item_id = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("Item can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @item_transaction.user_id = nil
      @item_transaction.valid?
      expect(@item_transaction.errors.full_messages).to include("User can't be blank")
    end
  end
end