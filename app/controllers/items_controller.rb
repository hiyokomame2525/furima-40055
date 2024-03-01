class ItemsController < ApplicationController
  before_action :move_to_index,except:[:index, :show]
  
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

  private
    def move_to_index
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end 

    def item_params
      params.require(:item).permit(:image, :title, :content, :category_id, :preservation_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, :amount).merge(user_id: current_user.id)
    end
end
