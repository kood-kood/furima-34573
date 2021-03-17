class MessagesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    message = Message.new(message_params)
    if message.save
      redirect_to item_path(@item)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private
  def message_params
    params.require(:message).permit(:string).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
