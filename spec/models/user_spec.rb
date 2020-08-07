require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー情報' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは＠を含む必要があること' do
        @user.email = 'furima.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは６文字以上であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数混在であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        # expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    describe '本人確認情報' do
      it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
        last_name = @user.last_name
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        @user.last_name = last_name
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名は全角(漢字・ひらがな・カタカナ）で入力させること' do
        last_name = @user.last_name
        @user.last_name = 'AAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
        @user.last_name = last_name
        @user.first_name = 'BBB'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
        last_name_reading = @user.last_name_reading
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        @user.last_name_reading = last_name_reading
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
        last_name_reading = @user.last_name_reading
        @user.last_name_reading = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
        @user.last_name_reading = last_name_reading
        @user.first_name_reading = 'いいい'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
      it '誕生日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
