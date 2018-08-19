class CreateChatchannelUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chatchannel_users do |t|
      t.references :chatchannel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
