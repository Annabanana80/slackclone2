class Chatchannel < ApplicationRecord
  has_many :chatchannel_users, dependent: :destroy
  has_many :users, through: :chatchannel_users
  has_many :messages, dependent: :destroy

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_names = users.map(&:username).sort
    name = "#{user_names.join(" ~ ")}"

    if chatchannel = direct_messages.where(name: name).first
      chatchannel
    else
      
      chatchannel = new(name: name, direct_message: true)
      chatchannel.users = users
      chatchannel.save
      chatchannel
    end
  end
end
