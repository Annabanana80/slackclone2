class AddDirectMessageToChatchannels < ActiveRecord::Migration[5.0]
  def change
  	add_column :chatchannels, :direct_message, :boolean, default: false
  end
end
