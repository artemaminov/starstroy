class Scheme < ActiveRecord::Base
  belongs_to :block, inverse_of: :scheme, dependent: :destroy
  has_one :image, as: :attachable, class_name: Attachment, dependent: :destroy

  accepts_nested_attributes_for :image

  rails_admin do
    weight 2

    list do
      field :block
      field :title
      field :position
    end

    edit do
      field :block
      field :title
      field :position
      field :image do
        inverse_of :block
      end
    end

  end
end
