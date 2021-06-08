class LocationsController < ApplicationController
  def home
    @locations = Location.all

    @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          image_url: helpers.asset_url('http://res.cloudinary.com/dii4d3v8r/image/upload/e771xoeam8aemjijplblnezgsm9c'),
          # @photo = cl_image_tag("l1j908vsqjnxe4z1khsnxv0qcbrd"),
          # cl_image_tag location.albums.first.photos.first.key

          # image_url: helpers.asset_url("san_francisco.jpg")
        }
    end
  end
#{cl_image_tag(location.albums.first.photos.first.key)}
# cl_image_tag(Location.first.albums.first.photos.first.key)
# cl_image_path(Location.first.albums.first.photos.first.key)
# "me42ildp9bm0g2ytzz3w2dhlk4pr"
# cl_image_tag("me42ildp9bm0g2ytzz3w2dhlk4pr")
# cl_image_path("me42ildp9bm0g2ytzz3w2dhlk4pr")
# cl_image_path(me42ildp9bm0g2ytzz3w2dhlk4pr)
# cl_image_tag("me42ildp9bm0g2ytzz3w2dhlk4pr",
#       width: 400, height: 300, crop: :fill)

  def show
    @location = Location.find(params[:id])
    @comment = Comment.find(params[:id])
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
      params.require(:location).permit(:name, :address, albums_attributes: [photos: []], comments_attributes: [:text])
  end
end
