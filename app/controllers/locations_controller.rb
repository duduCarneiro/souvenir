class LocationsController < ApplicationController
  def home
    @locations = Location.all
    @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          info_window: render_to_string(partial: "info_window", locals: { location: location }),
          # @photo = cl_image_tag("l1j908vsqjnxe4z1khsnxv0qcbrd"),
          # image_url: helpers.asset_url(@photo,
          # width: 150, height: 150, crop: :thumb, gravity: :face)
          image_url: helpers.asset_url("san_francisco.jpg")
        }
    end
  end
end
