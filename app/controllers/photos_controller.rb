class PhotosController < ApplicationController
  def new
  end

  def index
    @photos = Photo.all
    #this will allow index to render all photos.
  end

  def show
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render ('index')
    end
    #using the image param and filling in the other info create a new Photo and make variable called photo.
    #save that photo to Photo.all table. 

    # redirect to index of your own. 
  end

  def update
  end

  def destroy
  end

  private
    def photo_params
      params.require(:photo).permit(:image)
    end

end
