class Customer < ActiveRecord::Base

  rails_admin do
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
