class Block < ActiveRecord::Base
  has_many :offers
  has_many :attachments, as: :attachable
  belongs_to :customer

  rails_admin do
    list do
      field :title
    end

    edit do
      field :title
      field :info
      field :popup
      field :customer
      field :finish
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
