require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '画像は1枚必須であること(ActiveStorage)' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Images can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必至であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_charges = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end
    it '配送元の地域についての情報が必須であること' do
      @item.shipping_region = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day_until_shipping = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day until shipping can't be blank")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、￥300~￥9,999,999の間であること' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
   
  end
end