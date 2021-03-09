class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    binding.pry
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :phone_number, :postal_code, :shipping_area_id, :municipality, :building_name).merge(user_id: params[:user_id], item_id: params[:item_id], token: params[:token])
  end
  
end
