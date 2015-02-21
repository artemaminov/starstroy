class BlocksController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render json: Block.all.as_json(:include => [:attachments, :customer, :offers])
      }
      format.html { redirect_to '/' }
    end
  end

  def show
    respond_to do |format|
      format.json {
        render json: Block.find(params[:id]).as_json(:include => [:attachments, :scheme, :three_d_templates, :customer, :offers])
      }
      format.html { render 'home/index' }
    end
  end

  def planoplan
    @block = Block.find(params[:id])
    render layout: 'planoplan' if @block
  end

end
