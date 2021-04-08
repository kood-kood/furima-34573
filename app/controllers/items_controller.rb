class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :search]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :tamper_prevention, only: [:edit, :update, :destroy]
  before_action :move_to_page, only: [:edit, :update]
  before_action :search_item, only: [:index, :search]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit
    end
  end

  def show
    @items = Item.all
    @messages = Message.all
    @message = Message.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'item_channel', content: @message
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
    @results = @p.result
  end


  private


  def item_params
    params.require(:item).permit(:keyword, :content,:image, :product_name, :price, :description, :category_id, :product_condition_id,:shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def message_params
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:id])
   end

   def tamper_prevention
    redirect_to root_path unless current_user.id == @item.user_id
   end

   def move_to_page
    if @item.order.present?
      redirect_to root_path 
    end
   end

   def search_item
    @p = Item.ransack(params[:q])  
  end

end
