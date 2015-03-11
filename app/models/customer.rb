class Customer < ActiveRecord::Base

  rails_admin do
    weight 3
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
