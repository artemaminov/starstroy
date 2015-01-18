class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html {
        @company = Company.first
      }
    end
  end

  def blockslist
    respond_to do |format|
      format.json {
        render json: Block.all.to_json(:include => :attachments)
      }
    end
  end

  def block
    respond_to do |format|
      format.json {
        render json: Block.find(params[:id]).to_json(:include => :attachments)
      }
    end
  end

end
