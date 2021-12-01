require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    sleep 0.1
    @item = FactoryBot.create(:item)
    sleep 0.1
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe "商品購入情報の保存" do
    context '内容に問題ない場合' do
      it "全ての値が正しく保存されていれば保存できること" do
        expect(@order_shipping).to be_valid
      end
      it "buildingは空でも保存できること" do
        @order_shipping.building = ""
        expect(@order_shipping).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it "postal_codeが空だと保存できない" do
        @order_shipping.postal_code = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeが「3桁ハイフン4桁」の半角文字列でしか保存できない" do
        @order_shipping.postal_code = "1234567"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it "prefecture_idが空だと保存できない" do
        @order_shipping.prefecture_id = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "cityが空では保存できない" do
        @order_shipping.city = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "City can't be blank"
      end
      it "addressesが空では保存できない" do
        @order_shipping.addresses = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Addresses can't be blank"
      end
      it "phone_numberがなければ保存できない" do
        @order_shipping.phone_number = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number can't be blank"
      end
      it "tokenがなければ保存できない" do
        @order_shipping.token = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Token can't be blank"
      end
      it "電話番号は、10桁か11桁の半角数値のみ保存可能なこと" do
        @order_shipping.phone_number = "090123456789"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number is invalid"
      end
      it "userが紐づいていないと保存できないこと" do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "User can't be blank"
      end
      it "itemが紐づいていないと保存できないこと" do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Item can't be blank"
      end
      it "prefecture_idに「---」が選択されているときは保存できない" do
        @order_shipping.prefecture_id = "1"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end