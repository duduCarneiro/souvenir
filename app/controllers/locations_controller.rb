class LocationsController < ApplicationController
  def home
    @locations = Location.all

    @markers = @locations.map do |element|
      {
      idlocation: element.id,
      lat: element.latitude,
      lng: element.longitude,
      main_image: element.albums.first.photos.first.key
    }
    end

  end
 # let marker = WE.marker([element.latitude, element.longitude]).addTo(earth)


    # @markers = @locations.geocoded.map do |location|
    #     {
    #       lat: location.latitude,
    #       lng: location.longitude,
    #       image_url: helpers.asset_url('http://res.cloudinary.com/dii4d3v8r/image/upload/e771xoeam8aemjijplblnezgsm9c'),
    #       # <script>let marker = WE.marker([element.latitude, element.longitude]).addTo(earth);</script>,
    #       # @photo = cl_image_tag("l1j908vsqjnxe4z1khsnxv0qcbrd"),
    #       # cl_image_tag location.albums.first.photos.first.key
    #       # image_url: helpers.asset_url("san_francisco.jpg")
    #     }
    # end



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
