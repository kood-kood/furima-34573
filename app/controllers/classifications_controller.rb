class ClassificationsController < ApplicationController
  before_action :search_item, only: [:index, :search]


  def index
    @items = Item.all
    
  end

  def search

    @results = @p.result # 検索条件にマッチした商品の情報を取得
  
  end

  
  private

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

end
