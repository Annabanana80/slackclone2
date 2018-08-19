class ChatchannelUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_chatchannel
	
	def create
		@chatchannel_user = @chatchannel.chatchannel_users.where(user_id: current_user.id).first_or_create
		redirect_to @chatchannel
	end

	def destroy
		@chatchannel_user = @chatchannel.chatchannel_users.where(user_id: current_user.id).destroy_all
		redirect_to chatchannels_path
	end


	private

		def set_chatchannel
			@chatchannel = Chatchannel.find(params[:chatchannel_id])
		end

end