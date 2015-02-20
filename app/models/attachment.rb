class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  belongs_to :block

  scope :block, -> { where(attachable_type: 'Block') }

  mount_uploader :attachment, AttachmentUploader

  rails_admin do
    list do
      field :title
      field :position
      field :attachable_id
    end
    edit do
      field :title
      field :position
      field :attachment, :carrierwave
    end
    nestable_list ({
                      position_field: :position,
                      enable_callback: false,
                      scope: :block,
                      live_update: false
                  })
  end
end
