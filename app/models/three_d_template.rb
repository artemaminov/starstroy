class ThreeDTemplate < ActiveRecord::Base
  belongs_to :block
  has_one :cover, -> { where attachable_type: 'Cover' }, class_name: Attachment, foreign_key: :attachable_id

  accepts_nested_attributes_for :cover

  rails_admin do
    list do
      field :block
    end
  end
end
