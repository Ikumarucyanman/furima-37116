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
      end
      it "buildingは空でも保存できること" do
      end
    end
  
    context '内容に問題がある場合' do
      it "postal_codeが空だと保存できない" do
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
      end
      it "prefecture_idが空だと保存できない" do
      end
      it "cityが空では保存できない" do
      end
      it "addressesが空では保存できない" do
      end
      it "phone_numberがなければ保存できない" do
      end
      it "tokenがなければ保存できない" do
      end
      it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      end
      it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      end
      it "userが紐づいていないと保存できないこと" do
      end
      it "itemが紐づいていないと保存できないこと" do
      end
      it "prefecture_idに「---」が選択されているときは保存できない" do
      end
    end
  end
end