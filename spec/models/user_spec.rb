require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー情報' do
      it "ニックネームが必須であること" do
        
      end
      it "メールドレスが必須であること" do
        
      end
      it "メールアドレスが一意性であること" do
        
      end
      it "メールアドレスは＠を含む必要があること" do
        
      end
      it "パスワードは６文字以上であること" do
      end
      it "パスワードは半角英数混在であること" do
      end
      it "パスワードは確認用を含めて2回入力すること" do
        
      end
    end

    describe '本人確認情報' do
      it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
        
      end
      it "ユーザー本名は全角(漢字・ひらがな・カタカナ）で入力させること" do
        
      end
      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
        
      end
      it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
        
      end
      it "誕生日が必須であること" do
          
      end
    end
  end
end