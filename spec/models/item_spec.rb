require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品投稿' do
    context "投稿ができる場合" do
      it "image、name、explanation、category_id、status_id、fee_id、prefecture_id、schedule_id、price、user_idがない場合投稿できない" do
        expect(@item).to be_valid
      end
    end
    context "投稿ができない場合" do
      # it "商品画像が空では出品できない" do
      #   @item.image = nil
      #   @item.valid?
      #   binding.pry
      #   expect(@item.errors.full_messages).to include "Image can't be blank"
      # end
      it "nameがなければ投稿できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "explanationがなければ投稿できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "category_idがなければ投稿できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "status_idがなければ投稿できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "fee_idがなければ投稿できない" do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it "prefecture_idがなければ投稿できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "schedule_idがなければ投稿できない" do
        @item.schedule_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule can't be blank"
      end
      it "priceがなければ投稿できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "カテゴリーに「---」が選択されている場合は出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "商品の状態に「---」が選択されている場合は出品できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "配送料の負担に「---」が選択されている場合は出品できない" do
        @item.fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it "発送元の地域に「---」が選択されている場合は出品できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "発送までの日数に「---」が選択されている場合は出品できない" do
        @item.schedule_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule can't be blank"
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = "1９九！あカ。aK"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "価格が300円未満では出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "価格が9_999_999円を超えると出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
