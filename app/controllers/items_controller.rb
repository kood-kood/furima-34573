class ItemsController < ApplicationController


  def index
    @items = Item.all
  end


 def new
  end

  def edit
  end

  def show
  end


  # private

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

end
