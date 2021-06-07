class LocationsController < ApplicationController
  def home
    @locations = Location.all
  end
end
