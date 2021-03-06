require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)

  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに＠があれば登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid

      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが入力されていれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it 'nameとsurnameが入力されていれば登録できる' do
        @user.name = 'あああ'
        @user.surname = 'あああ'
        expect(@user).to be_valid
      end
      it 'nameとsurnameが全角であれば登録できる' do
        @user.name = 'あああ'
        @user.surname = 'あああ'
        expect(@user).to be_valid
      end
      it 'name_kanaとsurname_kanaが入力されていれば登録できる' do
        @user.name_kana = 'アアア'
        @user.surname_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'name_kanaとsurname_kanaが全角カナであれば登録できる' do
        @user.name_kana = 'アアア'
        @user.surname_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'birthdayが存在すれば登録できる' do
        @user.birthday = '1999-01-01'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が無い場合登録できない' do
        @user.email = 'aaaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")

      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordに英字が無い場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordに数字が無い場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角の場合登録できない' do
        @user.password = 'ａａａａａａ'
        @user.password_confirmation = 'ａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しない場合登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '67890a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nameが存在してもsurnameが空では登録できない' do
        @user.name = 'あああ'
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname 全角文字を使用してください")
      end
      it 'nameとsurnameは全角でないと登録できない' do
        @user.name = 'ｱｱｱ'
        @user.surname = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください", "Name 全角文字を使用してください")
      end
      it 'name_kanaが存在してもsurname_kanaが空では登録できない' do
        @user.name_kana = 'アアア'
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana can't be blank", "Surname kana 全角カタカナを使用してください")
      end
      it 'name_kanaとsurname_kanaは全角カナでないと登録できない' do
        @user.name_kana = 'あああ'
        @user.surname_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana 全角カタカナを使用してください", "Name kana 全角カタカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
