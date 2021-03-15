require 'rails_helper'
RSpec.describe UserBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)    
    @user_buyer = FactoryBot.build(:user_buyer, user_id: user.id, item_id: item.id)  
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '購入がうまくいくいくとき' do
      it '全ての値が正しい時に購入できる' do
        expect(@user_buyer).to be_valid
      end
      it '建物名が空でも購入できる' do
        @user_buyer.building_name = ""
        expect(@user_buyer).to be_valid
      end  
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空では登録できない' do
        @user_buyer.postal_code = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が空では登録できない' do
        @user_buyer.area_id = 1
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Area Select"
      end
      it '市区町村が空では登録できない' do
        @user_buyer.municipality = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空では登録できない' do
        @user_buyer.address = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では登録できない' do
        @user_buyer.phone_number = ""
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号にハイフンが入っていないと登録できない' do
        @user_buyer.postal_code = "1234567"
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '電話番号が11桁以内じゃないと購入できない' do
        @user_buyer.phone_number = "090123456789"
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Phone number is invalid."
      end
      it '電話番号が英数混合ではと購入できない' do
        @user_buyer.phone_number = "090aaaabbbb"
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Phone number is invalid."
      end
      it '市区町村が全角でないと登録できない' do
        @user_buyer.municipality = "ﾃｽﾄ"
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include "Municipality is invalid. Input full-width characters"
      end
      it 'tokenが空では登録できないこと' do
        @user_buyer.token = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザーidが空では登録できないこと' do
        @user_buyer.user_id = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("User can't be blank")
      end
      it '商品idが空では登録できないこと' do
        @user_buyer.item_id = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end 
end