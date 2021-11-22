require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録できる時" do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば保存できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない時" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
        it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "birthbayが空では保存ができない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it "メールアドレスに@を含まない場合は登録できない" do
        @user.email = "imo.imo"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "英字のみのパスワードでは登録できない" do
        @user.password = "iiiiii"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = "イモイモイモ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "姓(全角)に半角文字が含まれていると登録できない" do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it "名(全角)に半角文字が含まれていると登録できない" do
        @user.first_name = "imo"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "姓(カナ)にカタカナ以外の文字(平仮名•漢字•英数字•記号)が含まれていると登録できない" do
        @user.last_name_kana = "あ,伊,f,!"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角カタカナを使用してください"
      end
      it "名(カナ)にカタカナ以外の文字(平仮名•漢字•英数字•記号)が含まれていると登録できない" do
        @user.first_name_kana = "あ,伊,f,!"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナを使用してください"
      end
    end
  end
end
