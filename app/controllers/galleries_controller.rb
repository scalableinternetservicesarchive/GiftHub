class GalleriesController < ApplicationController
  def index
  	@photos = Photo.all
  end

  private 
  	def gallery_parms
  		params.require(:photo).permit(:image)
  	end

end
