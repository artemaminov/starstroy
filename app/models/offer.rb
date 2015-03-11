class Offer < ActiveRecord::Base

  belongs_to :block

  rails_admin do
    weight 1
    configure :till do
      date_format :default
    end
    list do
      field :title
    end
    edit do
      field :title
      field :info
      field :till
      field :block
    end
  end
end
