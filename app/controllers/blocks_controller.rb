class BlocksController < ApplicationController

  def index
    respond_to do |format|
      format.json {
        render json: { blocks: Block.all.as_json(include: [{ attachments: { methods: :pricelist }}, :customer, :active_offers]), price: Block.pricelist }
      }
      format.html { redirect_to '/' }
    end
  end

  def show
    respond_to do |format|
      format.json {
        render json: Block.find(params[:id]).as_json(include: [:attachments, { scheme: { include: :image } }, { three_d_templates: { include: :cover }}, :customer, :active_offers ])
      }
      format.html { render 'home/index' }
    end
  end

  def plans
    @block = Block.find(params[:id])
    render partial: 'plans' if @block
  end

  def planoplan
    @planoplan = ThreeDTemplate.find(params[:id])
    render layout: 'planoplan' if @planoplan
  end

end
