class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_chatchannel

	def create
		message = @chatchannel.messages.new(message_params)
		message.user = current_user
		message.save
		MessageRelayJob.perform_later(message)	
	end

	private

		def set_chatchannel
			@chatchannel = Chatchannel.find(params[:chatchannel_id])
		end

		def message_params
			params.require(:message).permit(:body)
		end
end