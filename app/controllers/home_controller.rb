class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html {
        @company = Company.first
      }
    end
  end

end
