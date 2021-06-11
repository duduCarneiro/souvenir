class LocationsController < ApplicationController
  def home
    @locations = Location.all

    @markers = @locations.map do |element|
      {
      idlocation: element.id,
      lat: element.latitude,
      lng: element.longitude,
      kpic: element.albums.first.photos.first.try(:key),
      ppic: ''
     }
    end

    if params[:query].present?
      @albums = Album.global_search(params[:query]).order(created_at: :desc)
      @comments = Comment.global_search(params[:query]).order(created_at: :desc)
    # else
    #   @albums = Album.all.order(created_at: :desc)
    #   @comments = Comment.all.order(created_at: :desc)
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
