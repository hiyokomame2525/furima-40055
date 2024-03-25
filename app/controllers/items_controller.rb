class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :itemfind, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if @item.purchase_history
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private
    def item_params
      params.require(:item).permit(:image, :title, :content, :category_id, :preservation_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, :amount).merge(user_id: current_user.id)
    end

    def itemfind
      @item = Item.find(params[:id])
    end
end
