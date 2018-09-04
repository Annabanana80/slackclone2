class Message < ApplicationRecord
  belongs_to :chatchannel
  belongs_to :user
  
  mount_uploader :attachment, AttachmentUploader

  private
    def attachment_size_validation
      errors[:attachment] << "should be less than 500KB" if attachment.size > 0.5.megabytes
    end
  
end
