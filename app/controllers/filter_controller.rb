class FilterController < ApplicationController

  # GET /filter/cuisines
  def cuisines
    @resturants = Resturant.where("cuisines LIKE ?", params[:cuisines])
  end

  # GET /filter/location
  def location
    @filter = Resturant.where("location LIKE ?", params[:location])
  end
end
