class ThreeDTemplate < ActiveRecord::Base
  belongs_to :block
  has_one :cover, -> { where attachable_type: 'Cover' }, as: :attachable, class_name: Attachment, foreign_key: :attachable_id, dependent: :delete

  accepts_nested_attributes_for :cover

  rails_admin do
    weight 8
    list do
      field :block
      field :title
    end
  end
end
