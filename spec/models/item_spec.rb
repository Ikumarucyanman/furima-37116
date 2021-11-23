require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品投稿' do
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
      # binding.pry
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
  end
end
