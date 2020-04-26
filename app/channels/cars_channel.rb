class CarsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cars"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
