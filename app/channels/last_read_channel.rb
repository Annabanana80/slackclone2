class LastReadChannel < ApplicationCable::Channel
  def subscribed

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    chatchannel_user = current_user.chatchannel_users.find_by(chatchannel_id: data["chatchannel_id"])
    chatchannel_user.update(last_read_at: Time.zone.now)
  end
end