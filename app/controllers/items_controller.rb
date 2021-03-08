class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
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


  # def article_params
  #   params.require(:item).permit(:user_id)
  # end
  # 「user_id」の情報を受け取るように設定
end
