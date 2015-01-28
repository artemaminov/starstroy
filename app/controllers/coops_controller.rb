class CoopsController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render :json => Company.all.as_json
      }
      format.html {
        render 'home/index'
      }
    end
  end


end