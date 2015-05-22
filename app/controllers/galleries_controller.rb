class GalleriesController < ApplicationController
  def index
    @exchanges = Exchange.where(["registration_start < :now && registration_end < :now", { now: Time.now }] )
  	@photos = Photo.all
  end

  private 
  	def gallery_parms
  		params.require(:photo).permit(:image)
  	end

end
