class AddLastReadAtToChatchannelUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :chatchannel_users, :last_read_at, :datetime
  end
end
