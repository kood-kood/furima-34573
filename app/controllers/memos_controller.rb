class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @memos = Memo.all.order(created_at: :ASC)
  end

   def new
    @memos = Memo.all
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      ActionCable.server.broadcast 'memo_channel', content: @memo
    end
  end

  private

  def memo_params
    params.permit(:memo)
  end

end

# , item_id: params[:item_id]