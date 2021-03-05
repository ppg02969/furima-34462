require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it '商品名が40字以下だと登録できる' do
        expect(@item).to be_valid
      end
      it '商品説明が1000字以下だと登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '商品名が空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明が空では登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it '商品状態が選択されていないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status Select"
      end
      it '配送料が選択されていないと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee Select"
      end
      it '発送元が選択されていないと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area Select"
      end
      it '発送までの日数が選択されていないと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day Select"
      end
      it '価格が半角数字以外だと登録できない' do
        @item.price = "１２あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Half-width number"
      end
      it '価格が299円以下の場合は保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '価格が10,000,000円以上の場合保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end

    end
  end
end


