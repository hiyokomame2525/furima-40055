class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :itemset, omly[:index, :create]

  def index
    unless current_user.id == @item.user.id
      unless @item.purchase_history
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        @purchase_history_address = PurchaseHistoryAddress.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    if @purchase_history_address.valid? 
      pay_item
      @purchase_history_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def itemset
    @item = Item.find(params[:item_id])
  end

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.amount,  
        card: purchase_history_address_params[:token],    
        currency: 'jpy'                
       )
  end

end