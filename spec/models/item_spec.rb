require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

   context '商品が出品できないとき' do
    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Imageが入力されていません。')
    end
    it 'product_nameが空では登録できないこと' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Product nameが入力されていません。')
    end
    it 'descriptionが空では登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Descriptionが入力されていません。')
    end
    it 'categoryが空では登録できないこと' do
      @item.category_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include('Categoryは1以外の値にしてください')
    end
    it 'product_conditionが空では登録できないこと' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product conditionは1以外の値にしてください')
    end
    it 'shipping_chargeが空では登録できないこと' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping chargeは1以外の値にしてください')
    end
    it 'shipping_areaが空では登録できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping areaは1以外の値にしてください')
    end
    it 'days_to_shipが空では登録できないこと' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to shipは1以外の値にしてください')
    end
    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceが入力されていません。", "Priceは有効でありません。", "Priceは数値で入力してください")
    end
    
    it '販売価格は、¥300以上でなければ登録できないこと' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceは300以上の値にしてください')
    end
    it '販売価格は、¥9,999,999以下でなければ登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceは9999999以下の値にしてください')
    end
    it '販売価格は半角数字でなければ登録できないこと' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceは数値で入力してください')
    end
   end
  end
end
# nil
# find("#tour_genre_id").find("option[value='1']").select_option