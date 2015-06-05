class GalleriesController < ApplicationController
  def index
    @exchanges = Exchange.where("registration_start < :now AND registration_end < :now", { now: DateTime.now }).reverse_order
    @current_galleries = Gallery.where(exchange_id: @exchanges.last.id)
  end

  def exchange_galleries
    @current_galleries = Gallery.where(exchange_id: params[:id])
    respond_to do |format|
      format.json { render json: @current_galleries }
    end
  end

  private 
  	def gallery_parms
  		params.require(:photo).permit(:image)
  	end

end
