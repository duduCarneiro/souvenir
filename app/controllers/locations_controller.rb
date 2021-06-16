class LocationsController < ApplicationController
  def home
    if params[:query].present?
      @locations = Location.global_search(params[:query])
      @albums = Album.global_search(params[:query]).order(created_at: :desc)
      @comments = Comment.global_search(params[:query]).order(created_at: :desc)

    else
    @locations = Location.all
    #   @albums = Album.all.order(created_at: :desc)
    #   @comments = Comment.all.order(created_at: :desc)
    end
  

    @markers = @locations.geocoded.map do |location|
      {
      lat: location.latitude,
      lng: location.longitude,
      kpic: location.albums.first.photos.first.try(:key),
      redirect_to: location_url(location),
      image_url: '',
      id: location.id # we add the id of the flat in the hash

      # image_url: helpers.asset_url(cl_image_path('6tgvujx90x75374ypiiy1rq9qted'))
      # image_url: cl_image_path('6tgvujx90x75374ypiiy1rq9qted')
      # image_url: helpers.asset_url(cl_image_path('6tgvujx90x75374ypiiy1rq9qted'))
      # kpic: location.albums.first.photos.first.try(:key),
      # ppic: ''
     }
    end

  end
  
  def show
    @location = Location.find(params[:id])
    @comments = Comment.where("location_id = ? ", params[:id]) 
    @albums = Album.where("location_id = ? ", params[:id]) 
  end

  def new
    @location = Location.new
    @location.albums.build
    @location.comments.build
  end

  def create
    
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to location_path(@location), notice: "Experience created"
    else
      render :new
    end
  end

  private

  def location_params
      params.require(:location).permit(:name, :address, :albums_attributes => [:date, :_destroy, photos: []] ,comments_attributes: [:text, :date, :_destroy])
  end
end
