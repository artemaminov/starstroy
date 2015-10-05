class Customer < ActiveRecord::Base

  has_many :blocks

  rails_admin do
    weight 4
    list do
      field :title
    end
    edit do
      field :title
      field :info
      field :phone
      field :address
      field :site
    end
  end
end
