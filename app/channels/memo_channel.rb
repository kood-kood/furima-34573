class MemoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "memo_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
