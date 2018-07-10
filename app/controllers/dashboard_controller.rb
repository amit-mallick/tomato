class DashboardController < ApplicationController

  before_filter :current_user

  def show
    @resturants = Resturant.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 3)
    @ratings = Rating.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html
      format.json {render json: @resturants << @ratings}
    end
  end

end
