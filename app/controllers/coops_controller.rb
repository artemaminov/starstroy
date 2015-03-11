class CoopsController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render json: { company: Company.first.as_json, customers: Customer.all.as_json }
      }
      format.html {
        render 'home/index'
      }
    end
  end


end