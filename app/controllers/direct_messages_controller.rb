class DirectMessagesController < ApplicationController
	before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    @chatchannel = Chatchannel.direct_message_for_users(users)
    @messages = @chatchannel.messages.order(created_at: :desc).limit(100).reverse
    @chatchannel_user = current_user.chatchannel_users.find_by(chatchannel_id: @chatchannel.id)
    render "chatchannels/show"
  end
end
