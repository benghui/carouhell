class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # Message.create! content: data['message'] #move model writing to the job
    MessageBroadcastJob.perform_later data['message']
  end
end
