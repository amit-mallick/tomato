class DashboardController < ApplicationController

  before_filter :current_user

  def show
    @resturants = Resturant.where(user_id: current_user.id).all
    @ratings = Rating.where(user_id: current_user.id).all

    respond_to do |format|
      format.html
      format.json {render json: @resturants << @ratings}
    end
  end

end
