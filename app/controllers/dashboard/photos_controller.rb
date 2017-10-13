class Dashboard::PhotosController < DashboardController
  def index
    @photos = current_pro.photos
  end

  def new
    @photo = current_pro.photos.new()
  end

  def create
    @photo = current_pro.photos.new(photo_params)
    redirect_back(fallback_location: root_path) if @photo.save
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :photo)
  end

end
