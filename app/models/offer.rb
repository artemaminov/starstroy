class Offer < ActiveRecord::Base

  belongs_to :block

  rails_admin do
    list do
      field :title
    end
    edit do
      field :title
      field :info
      field :till do
        date_format :default
      end
      field :block
    end
  end
end
