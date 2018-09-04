class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatchannels:#{message.chatchannel.id}", {
    	image: message.user.image_url,
		username: message.user.username,
      	body: message.body,
      	chatchannel_id: message.chatchannel.id,
      	
    }
  end
end
