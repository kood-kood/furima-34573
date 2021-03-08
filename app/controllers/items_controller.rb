class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:content,:image, :product_name, :price, :description, :category_id, :product_condition_id,:shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

  # def article_params
  #   params.require(:item).permit(:user_id)
  # end
  # 「user_id」の情報を受け取るように設定
end
