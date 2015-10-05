class Block < ActiveRecord::Base
  has_many :offers, dependent: :destroy
  has_many :active_offers, -> { where "till > '#{ Date.current }'" }, class_name: 'Offer'
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :three_d_templates, dependent: :destroy
  has_one :scheme, -> { where attachable_type: 'Scheme' }, class_name: Attachment, foreign_key: :attachable_id, dependent: :delete
  belongs_to :customer, inverse_of: :blocks

  accepts_nested_attributes_for :scheme

  rails_admin do

    weight 0
    configure :finish do
      date_format :default
    end

    list do
      field :title
    end

    edit do
      field :title
      field :info
      field :popup
      field :customer do
        inverse_of :blocks
      end
      field :offers do
        inverse_of :blocks
      end
      field :finish
      field :scheme
      field :three_d_templates do
        inverse_of :blocks
      end
      field :attachments do
        inverse_of :attachable
        associated_collection_scope do
          Proc.new { |scope|
            scope = scope.blocks_only
          }
        end
      end
      field :latitude, :map do
        longitude_field :longitude
        google_api_key "AIzaSyDUIDzDRBwfv_TI36scUeAy6EEu3g-y0Ew"
        default_latitude 57.1511404617942
        default_longitude 65.539026260376
        default_zoom_level 16
      end
    end
  end
end
