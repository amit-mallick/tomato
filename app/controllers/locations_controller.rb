class LocationsController < ApplicationController

  def create
    @resturant = Resturant.find(params[:resturant_id])
    @location = @resturant.locations.create(params[:location])
    redirect_to root_url
  end

  def destroy
    @resturant = Resturant.find(params[:resturant_id])
    @location = @resturant.locations.find(params[:id])
    @location.destroy
    redirect_to root_url
  end

end
