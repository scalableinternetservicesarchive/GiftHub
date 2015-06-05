class PhotosController < ApplicationController
  def new
    @photo = Photo.new
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
    @gallery = Gallery.new(exchange_id: params[:id])
    @photo = Photo.new(:image => params[:photo][:image], :image_file_name => params[:photo][:image].original_filename, :image_content_type => params[:photo][:image].content_type)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to action: :index }
      else
        render ('update')
      end
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
      params.require(:photo).permit(:image, :image_file_name, :image_content_type)
      # params.require(:photo).permit(:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at)

    end

end
