class ContactsController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render json: Company.first.as_json(include: :files)
      }
      format.html {
        render 'home/index'
      }
    end
  end


end
