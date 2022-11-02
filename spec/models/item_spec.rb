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
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end 

      it '商品名(name)がなくて出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end 

      it '商品説明(description)がなくて出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end 

      it 'カテゴリ(category_id)がなくて出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end 

      it 'カテゴリ(category_id)が---(未選択)で出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end 

      it '状態(state_id)がなくて出品できない' do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end 

      it '状態(state_id)が---(未選択)で出品できない' do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end 

      it '配送料の負担(delivery_charge_burden_id)がなくて出品できない' do
        @item.delivery_charge_burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end 

      it '配送料の負担(delivery_charge_burden_id)が---(未選択)で出品できない' do
        @item.delivery_charge_burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end 

      it '配送元の地域(prefecture_id)がなくて出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end 

      it '配送元の地域(prefecture_id)が---(未選択)で出品できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end 

      it '配送までに日数(delivery_day_id)がなくて出品できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end 

      it '配送までに日数(delivery_day_id)が---(未選択)で出品できない' do
        @item.delivery_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end 

      it '価格(price)が空欄で出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end 

      it '価格(price)に半角英字が含まれて出品できない' do
        @item.price = "111aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end 

      it '価格(price)に全角が含まれて出品できない' do
        @item.price = "111あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end

      it '価格(price)が300円未満で出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
      end
      
      it '価格(price)が10000000円以上で出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザーを入力してください"
      end
    end
  end
end
