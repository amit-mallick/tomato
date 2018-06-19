class FilterController < ApplicationController

  # GET /filter/cuisines
  def cuisines
    @resturants = Resturant.where("cuisines LIKE ?", params[:cuisines])
  end

  # GET /filter/location
  def location
    @resturants = Resturant.all
    @location = Location.where("location LIKE ?", params[:location])
    @filter = []
    for r in @resturants
      for l in @location
        if r.id == l.resturant_id
          @filter << r
        end
      end
    end
  end
end
