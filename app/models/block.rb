class Block < ActiveRecord::Base
  has_many :offers, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :three_d_templates, dependent: :destroy
  has_one :scheme, -> { where attachable_type: 'Scheme' }, class_name: Attachment, foreign_key: :attachable_id, dependent: :delete
  belongs_to :customer

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
      field :customer
      field :offers
      field :finish
      field :scheme
      field :three_d_templates
      field :attachments
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
