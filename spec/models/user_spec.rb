require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do 
    context 'ユーザー新規登録ができる' do
      it 'すべての情報が正しく登録され、登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない' do
      it 'nicknameが空では登録できない' do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.nickname = ''  # nicknameの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.email = ''  # emailの値を空にする
        user.valid?
        expect(user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'メールアドレスが一意性ではない' do
        user1 = FactoryBot.build(:user)
        user1.save
        user2 = FactoryBot.build(:user)
        user2.email = user1.email
        user2.valid?
        expect(user2.errors.full_messages).to include "Eメールはすでに存在します"
      end

      it 'メールアドレスに、@が含まれていない' do
        user = FactoryBot.build(:user)
        user.email = "abcde.com"
        user.valid?
        expect(user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it 'PWが空では登録できない' do
        user = FactoryBot.build(:user)
        user.password = ""
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'PWが6文字未満では登録できない' do
        user = FactoryBot.build(:user)
        user.password = "1111a"
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end

      it 'PWが半角英数字混合されず登録できない' do
        user = FactoryBot.build(:user)
        user.password = "111111"
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it 'PWとPW確認が一致せず登録できない' do
        user = FactoryBot.build(:user)
        user.password = "111aaa"
        user.password_confirmation = "111bbb"
        user.valid?
        expect(user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it '英字のみのパスワードでは登録できない' do
        user = FactoryBot.build(:user)
        user.password = "aaaaaa"
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it '数字のみのパスワードでは登録できない' do
        user = FactoryBot.build(:user)
        user.password = "111111"
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it '全角文字を含むパスワードでは登録できない' do
        user = FactoryBot.build(:user)
        user.password = "１１１ａａａ"
        user.password_confirmation = user.password
        user.valid?
        expect(user.errors.full_messages).to include "パスワードは不正な値です"
      end

      # 本人情報の異常系テスト

      it 'first_nameが空欄で登録できない' do
        user = FactoryBot.build(:user)
        user.first_name = ""
        user.valid?
        expect(user.errors.full_messages).to include "名前を入力してください"
      end

      it 'last_nameが空欄で登録できない' do
        user = FactoryBot.build(:user)
        user.last_name = ""
        user.valid?
        expect(user.errors.full_messages).to include "苗字を入力してください"
      end

      it 'first_name_kanaが空欄で登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = ""
        user.valid?
        expect(user.errors.full_messages).to include "名前(カナ)を入力してください"
      end

      it 'last_name_kanaが空欄で登録できない' do
        user = FactoryBot.build(:user)
        user.last_name_kana = ""
        user.valid?
        expect(user.errors.full_messages).to include "苗字(カナ)を入力してください"
      end

      it 'birth_dateが空欄で登録できない' do
        user = FactoryBot.build(:user)
        user.birth_date = ""
        user.valid?
        expect(user.errors.full_messages).to include "生年月日を入力してください"
      end

      it 'first_nameに半角英数を含んで登録できない' do
        user = FactoryBot.build(:user)
        user.first_name = "aaa"
        user.valid?
        expect(user.errors.full_messages).to include "名前は不正な値です"
      end

      it 'last_nameに半角英数を含んで登録できない' do
        user = FactoryBot.build(:user)
        user.last_name = "aaa"
        user.valid?
        expect(user.errors.full_messages).to include "苗字は不正な値です"
      end

      it 'first_name_kanaに半角英数を含んで登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = "aaa"
        user.valid?
        expect(user.errors.full_messages).to include "名前(カナ)は不正な値です"
      end

      it 'last_name_kanaに半角英数を含んで登録できない' do
        user = FactoryBot.build(:user)
        user.last_name_kana = "aaa"
        user.valid?
        expect(user.errors.full_messages).to include "苗字(カナ)は不正な値です"
      end

      it 'first_name_kanaにひらがなを含んで登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = "たろう"
        user.valid?
        expect(user.errors.full_messages).to include "名前(カナ)は不正な値です"
      end

      it 'last_name_kanaにひらがなを含んで登録できない' do
        user = FactoryBot.build(:user)
        user.last_name_kana = "すずき"
        user.valid?
        expect(user.errors.full_messages).to include "苗字(カナ)は不正な値です"
      end
    end
  end
end
