class LocationsController < ApplicationController
  def home
    @locations = Location.all
    @markers = @locations.geocoded.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude
        }
    end
  end
end
