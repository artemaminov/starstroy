class Attachment < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  scope :blocks_only, -> { where attachable_type: 'Block' }
  default_scope { order('position ASC') }

  mount_uploader :attachment, AttachmentUploader

  # def imaged_label
  #   unless self.new_record?
  #     block = "#{Block.find(attachable_id).title} - " unless attachable_id.nil?
  #     "#{block}#{ActionController::Base.helpers.image_tag(attachment.thumb.url)}".html_safe
  #   end
  # end

  rails_admin do
    weight 6
    configure :attachable do
      visible false
    end
    list do
      field :title
      field :common
      field :position
      field :attachable do
        formatted_value do
          value.title if value
        end
      end
    end
    edit do
      field :common
      field :attachable
      field :title
      field :position
      field :attachment, :carrierwave
    end
    nestable_list ({
                      position_field: :position,
                      enable_callback: false,
                      scope: :blocks_only,
                      live_update: false
                  })
    # object_label_method :imaged_label
  end
end
