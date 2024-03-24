require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
  end
  describe '購入履歴と住所の保存' do
    
    context '必要事項を入力した場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_history_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @purchase_history_address.building_name = ''
        expect(@purchase_history_address).to be_valid
      end
    end

    context '必要事項を入力しなかった場合' do
      it 'postal_codeが空で保存できない' do
        @purchase_history_address.postal_code = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-(ハイフン)がないと保存できない' do
        @purchase_history_address.postal_code = 1234567
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idのidが2以上48以下でないと保存できない' do
        @purchase_history_address.prefecture_id = 1
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空で保存できない' do
        @purchase_history_address.municipality = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空で保存できない' do
        @purchase_history_address.street_address = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空で保存できない' do
        @purchase_history_address.telephone_number = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberに-(ハイフン)があると保存できない' do
        @purchase_history_address.telephone_number = '080-1234-56'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Telephone number is invalid. Please enter 10or11 digit half-width numbers.") 
      end
      it 'telephone_numberが10桁未満だと保存できない' do
        @purchase_history_address.telephone_number = 123456789
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number is invalid. Please enter 10or11 digit half-width numbers.')
      end
      it 'telephone_numberが11桁以上だと保存できない' do
        @purchase_history_address.telephone_number = 112234567899
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number is invalid. Please enter 10or11 digit half-width numbers.')
      end
      it 'telephone_numberが全角数字だと保存できない' do
        @purchase_history_address.telephone_number = '１２３４５６７８９９'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number is invalid. Please enter 10or11 digit half-width numbers.')
      end
      it 'tokenが空で保存できない' do
        @purchase_history_address.token = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐ついてないと保存できない' do
        @purchase_history_address.user_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついてないと保存できない' do
        @purchase_history_address.item_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
