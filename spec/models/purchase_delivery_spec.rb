require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do

  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('public/image/output-image1.png')
      item.save
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_delivery.building = ""
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'token空だと保存できないこと' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号(postcode)が空だと保存できないこと' do
        @purchase_delivery.postcode = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号(postcode)が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_delivery.postcode = "1111111"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode is invalid")
      end
      it '都道府県(prefecture_id）を選択していない(idが1の状態)と保存できないこと' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村(city)が空だと保存できないこと' do
        @purchase_delivery.city = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地(block)が空だと保存できないこと' do
        @purchase_delivery.block = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号(phone_number)が空だと保存できないこと' do
        @purchase_delivery.phone_number = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号(phone_number)に全角がふくまれると保存できないこと' do
        @purchase_delivery.phone_number = "０００００００００００"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号(phone_number)に半角英字がふくまれると保存できないこと' do
        @purchase_delivery.phone_number = "0000000000a"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号(phone_number)が10桁未満で保存できないこと' do
        @purchase_delivery.phone_number = "123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号(phone_number)が12桁以上で保存できないこと' do
        @purchase_delivery.phone_number = "123456789012"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
