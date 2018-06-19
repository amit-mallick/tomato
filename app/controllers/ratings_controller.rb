class RatingsController < ApplicationController

  before_filter :current_user, only: [:destroy, :create]

  def create
    if current_user
      @resturant = Resturant.find(params[:resturant_id])
      @rating = @resturant.ratings.create(params[:rating])
      @rating.update_attribute(:user_id, current_user.id)
      @rating.update_attribute(:commenter, current_user.name)
      redirect_to resturant_path(@resturant)
    else
      render text: "Login kr le"
    end
  end

  def destroy
    @resturant = Resturant.find(params[:resturant_id])
    @rating = @resturant.ratings.find(params[:id])

    if current_user
      if current_user.id == @rating.user_id
        @rating.destroy
        redirect_to resturant_path(@resturant)
      else
        render text: "You aren't the owner of this review"
      end
    else
      render text: "Login to kr leta"
    end
  end

end
