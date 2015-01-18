class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  mount_uploader :attachment, AttachmentUploader

  rails_admin do
    list do
      field :title
      field :attachment, :carrierwave
    end
    edit do
      field :title
      field :attachment, :carrierwave
    end
  end
end
