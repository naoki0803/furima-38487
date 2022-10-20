require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/output-image1.png')
  end

  describe '商品の出品' do 
    context '商品の出品ができる' do
      it 'すべての情報が正しく登録され、商品の出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない' do
      it '画像(image)がなくて出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end 

      it '商品名(name)がなくて出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end 

      it '商品説明(description)がなくて出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end 

      it 'カテゴリ(category_id)がなくて出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end 

      it 'カテゴリ(category_id)が---(未選択)で出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end 

      it '状態(state_id)がなくて出品できない' do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end 

      it '状態(state_id)が---(未選択)で出品できない' do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end 

      it '配送料の負担(delivery_charge_burden_id)がなくて出品できない' do
        @item.delivery_charge_burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge burden can't be blank"
      end 

      it '配送料の負担(delivery_charge_burden_id)が---(未選択)で出品できない' do
        @item.delivery_charge_burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge burden can't be blank"
      end 

      it '配送元の地域(prefecture_id)がなくて出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end 

      it '配送元の地域(prefecture_id)が---(未選択)で出品できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end 

      it '配送までに日数(delivery_day_id)がなくて出品できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end 

      it '配送までに日数(delivery_day_id)が---(未選択)で出品できない' do
        @item.delivery_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end 

      it '価格(price)が空欄で出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 

      it '価格(price)に半角英字が含まれて出品できない' do
        @item.price = "111aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 

      it '価格(price)に全角が含まれて出品できない' do
        @item.price = "111あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '価格(price)が300円未満で出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      
      it '価格(price)が10000000円以上で出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
