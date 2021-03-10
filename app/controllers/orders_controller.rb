class OrdersController < ApplicationController
  def index
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: order_params[:price],
    card: order_params[:token],
    currency: 'jpy'
  )
  end

end
