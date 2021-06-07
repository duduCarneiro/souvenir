class LocationsController < ApplicationController
  def home
    @locations = Location.all
    @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
          info_window: render_to_string(partial: "info_window", locals: { location: location })
        #   image_url: helpers.asset_url("car_icon.png")

        }
    end
  end
end
