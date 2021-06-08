class LocationsController < ApplicationController


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
