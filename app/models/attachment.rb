class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  belongs_to :block, foreign_key: :attachable_id

  scope :asc, -> { order('position ASC') }
  scope :blocks_only, -> { where(attachable_type: 'Block').asc }

  mount_uploader :attachment, AttachmentUploader

  # def imaged_label
  #   unless self.new_record?
  #     block = "#{Block.find(attachable_id).title} - " unless attachable_id.nil?
  #     "#{block}#{ActionController::Base.helpers.image_tag(attachment.thumb.url)}".html_safe
  #   end
  # end

  rails_admin do
    weight 9
    configure :attachable do
      visible false
    end
    list do
      field :title
      field :position
      field :block do
        formatted_value do
          value.title if value
        end
      end
    end
    edit do
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
