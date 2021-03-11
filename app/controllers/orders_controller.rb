class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = OrderDomicile.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDomicile.new(order_params)
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
    params.require(:order_domicile).permit(:address, :phone_number, :postal_code, :shipping_area_id, :municipality, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
  end

end