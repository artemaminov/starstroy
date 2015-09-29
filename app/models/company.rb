class Company < ActiveRecord::Base

  has_many :files, as: :attachable, class_name: Attachment, foreign_key: :attachable_id, dependent: :destroy

  accepts_nested_attributes_for :files

  rails_admin do
    weight 2
    list do
      field :about
      field :contacts
    end
    edit do
      field :about
      field :contacts
      field :coop
      field :files
    end
  end

end
