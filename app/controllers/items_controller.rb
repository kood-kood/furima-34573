class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :tamper_prevention, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    if @item.order.present?
      redirect_to root_path 
    end
  end

  def update
   if @item.order.present?
    redirect_to root_path 
   elsif @item.update(item_params)
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

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:content,:image, :product_name, :price, :description, :category_id, :product_condition_id,:shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

   def tamper_prevention
    redirect_to root_path unless current_user.id == @item.user_id
   end

end
