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
    @photo = Photo.new(:image => params[:photo][:image], :image_file_name => "shit" , :image_content_type => 1, :image_file_size => 1, :image_updated_at => 1100)
    if @photo.save!
      render ('index')
    else
      render ('update')
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
      params.require(:photo).permit(:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at)
    end

end
