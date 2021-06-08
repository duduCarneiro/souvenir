class LocationsController < ApplicationController
  def home
    @locations = Location.all

    @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          image_url: helpers.asset_url('http://res.cloudinary.com/dii4d3v8r/image/upload/e771xoeam8aemjijplblnezgsm9c'),
          info_window: render_to_string(partial: "info_window", locals: { location: location })
          # @photo = cl_image_tag("l1j908vsqjnxe4z1khsnxv0qcbrd"),
          # cl_image_tag location.albums.first.photos.first.key

          # image_url: helpers.asset_url("san_francisco.jpg")
        }
    end
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