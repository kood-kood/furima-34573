class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @memos = Memo.all.order(created_at: :ASC)
    @memo = Memo.new
  end

   def new
    @memos = Memo.all
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      # redirect_to memos_path
      ActionCable.server.broadcast 'memo_channel', content: @memo
    end
  end

  def destroy
    @memos = Memo.find(params[:id])
    if @memos.destroy
      redirect_to memos_path
    end
  end

private

  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id)
  end

end
# room = Room.find(params[:id])