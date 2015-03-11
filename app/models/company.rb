class Company < ActiveRecord::Base

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
    end
  end

end
