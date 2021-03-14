require 'rails_helper'
RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end

  describe '商品購入機能' do
    context '購入がうまくいくいくとき' do
      it '全ての値が正しい時に購入できる' do
        expect(@buyer).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空では登録できない' do
        @buyer.postal_code = ""
        @buyer.valid?
        binding.pry
        expect(@buyer.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が空では登録できない' do
        @buyer.area_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Area Select"
      end
      it '市区町村が空では登録できない' do
        @buyer.municipality = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空では登録できない' do
        @buyer.address = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では登録できない' do
        @buyer.phone_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号にハイフンが入っていないと登録できない' do
        @buyer.postal_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
    end
  end 
end





