require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要事項が入力されればユーザー登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していると登録できない' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'test.mail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordは5文字以下だと登録できない' do
        @user.password = 'xxxx1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは半角英字だけだと登録できない' do
        @user.password = 'xxxxxx'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は英字と数字の両方が必要です'
      end
      it 'passwordは半角数字だけだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は英字と数字の両方が必要です'
      end
      it 'passwordは半角英数字以外だと登録できない' do
        @user.password = '１Ａｂあ異う'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は英字と数字の両方が必要です'
      end
      it 'password confirmationがpasswordと不一致だと登録できない' do
        @user.password = 'xxxxx1'
        @user.password_confirmation = '11111x'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last nameが半角入力だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name は全角で入力してください'
      end
      it 'first nameが半角入力だと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角で入力してください'
      end
      it 'last pronunciationが空だと登録できない' do
        @user.last_pronunciation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last pronunciation can't be blank"
      end
      it 'first pronunciationが空だと登録できない' do
        @user.first_pronunciation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First pronunciation can't be blank"
      end
      it 'last pronunciationがカタカナ以外だと登録できない' do
        @user.last_pronunciation = 'yaま田'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last pronunciation はカタカナで入力してください'
      end
      it 'first pronunciationがカタカナ以外だと登録できない' do
        @user.first_pronunciation = '太ろu'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First pronunciation はカタカナで入力してください'
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
