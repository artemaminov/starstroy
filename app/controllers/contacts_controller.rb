class ContactsController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render :json => Company.first.as_json
      }
      format.html {
        render 'home/index'
      }
    end
  end


end
