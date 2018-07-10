class RatingsController < ApplicationController

  before_filter :check_current_user, only: [:destroy, :create]
  before_filter { find_resturant params[:resturant_id] }

  def create
      # @rating = @resturant.ratings.create(params[:rating], :user_id => current_user.id, :commenter => current_user.name)
      @rating = @resturant.ratings.create(params[:rating])
      @rating.update_attribute(:user_id, current_user.id)
      @rating.update_attribute(:commenter, current_user.name)
      redirect_to resturant_path(@resturant)
  end

  def destroy
    @rating = @resturant.ratings.find(params[:id])
      if current_user.id == @rating.user_id
        @rating.destroy
        redirect_to resturant_path(@resturant)
      else
        render text: "You aren't the owner of this review"
      end
  end

end
