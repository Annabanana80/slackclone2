class Message < ApplicationRecord
  belongs_to :chatchannel
  belongs_to :user
end
