require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録できるとき' do
      it '必要事項が入力がされていればデータベースに保存される' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'preservation_idが空では保存できない' do
        @item.preservation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Preservation can't be blank")
      end
      it 'delivery_charge_idが空では保存できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_time_idが空では保存できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it 'amountが空では保存できない' do
        @item.amount = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount can't be blank")
      end
      it 'amountが全角数字入力では保存できない' do
        @item.amount = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount is not a number')
      end
      it 'amountが300未満では保存できない' do
        @item.amount = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount must be greater than or equal to 300')
      end
      it 'amountが9999999より大きいと保存できない' do
        @item.amount = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount must be less than or equal to 9999999')
      end
    end
  end
end
