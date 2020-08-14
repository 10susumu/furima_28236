require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#create' do
    before do
      @ransaction = FactoryBot.build(:transaction)
    end
    it 'ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移すること' do
    end
    it '出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること' do
    end
    it 'URLを直接入力して購入済の商品ページに遷移しようとすると、トップページに遷移すること' do
    end
    it 'クレジットカード決済ができること' do
    end
    it 'クレジットカード情報は購入の都度入力させること' do
    end
    it 'クレジットカード情報は必須であり、正しいクレジットカードの情報でないときは決済できないこと' do
    end
    it '配送先の住所情報も購入の都度入力させること' do
    end
    it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること' do
    end
    it '郵便番号にはハイフンが必要であること(124-4567となる)' do
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
    end
  end
end