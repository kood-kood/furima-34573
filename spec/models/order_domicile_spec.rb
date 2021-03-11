require 'rails_helper'

RSpec.describe OrderDomicile, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_domicile, item_id: @item.id, user_id: @user.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての項目の入力が存在すれば購入できること' do
        expect(@order).to be_valid
      end
      it '建物番号は空でも登録できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end  
    end

    context '商品が購入できない時' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tokenが入力されていません。")
      end
      it 'postal_codeが空では登録できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal codeが入力されていません。", "Postal codeは有効でありません。")
      end
      it 'shipping_area_idが空では登録できないこと' do
        @order.shipping_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping areaは1以外の値にしてください")
      end
      it 'municipalityが空では登録できないこと' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalityが入力されていません。")
      end
      it 'addressが空では登録できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addressが入力されていません。")
      end
      it 'phone_numberが空では登録できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone numberが入力されていません。", "Phone numberは有効でありません。")
      end
     
      it '郵便番号にハイフンが含まれていなければ登録できないこと' do
        @user.email = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは有効でありません。")
      end
      it '電話番号は12桁以上では登録できないこと' do
        @order.phone_number = '0901234567891'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone numberは11文字以下に設定して下さい。")
      end
            
    end

  end

end
