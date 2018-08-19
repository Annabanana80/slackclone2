class ChatchannelsChannel < ApplicationCable::Channel
  def subscribed
  	current_user.chatchannels.each do |chatchannel|
  		stream_from "chatchannels:#{chatchannel.id}"
  	end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @chatchannel = Chatchannel.find(data["chatchannel_id"])
    message   = @chatchannel.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
