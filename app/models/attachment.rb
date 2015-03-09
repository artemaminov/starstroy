class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  belongs_to :block

  scope :block, -> { where(attachable_type: 'Block') }

  mount_uploader :attachment, AttachmentUploader

  # def imaged_label
  #   unless self.new_record?
  #     block = "#{Block.find(attachable_id).title} - " unless attachable_id.nil?
  #     "#{block}#{ActionController::Base.helpers.image_tag(attachment.thumb.url)}".html_safe
  #   end
  # end

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
    # object_label_method :imaged_label
  end
end
