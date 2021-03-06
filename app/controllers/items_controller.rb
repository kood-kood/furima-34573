class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  # def edit
  # end

  def show
    @items = Items.find(params[:id])
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

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def item_params
    params.require(:item).permit(:content,:image, :product_name, :price, :description, :category_id, :product_condition_id,:shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  # def article_params
  #   params.require(:item).permit(:user_id)
  # end
  # 「user_id」の情報を受け取るように設定
end


# :content,