class ThreeDTemplate < ActiveRecord::Base
  belongs_to :block
  has_one :cover, as: :attachable, class_name: Attachment, foreign_key: :attachable_id, dependent: :destroy, inverse_of: :attachable

  accepts_nested_attributes_for :cover

  rails_admin do
    weight 3
    list do
      field :block
      field :title
    end
  end
end
