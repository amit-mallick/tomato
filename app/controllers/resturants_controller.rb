class ResturantsController < ApplicationController

  before_filter :current_user, only: [:destroy, :create, :new, :edit, :update]
  before_filter :check_current_user, only: [:create]
  before_filter(only: [:edit, :show, :update, :destroy]) { find_resturant params[:id] }
  before_filter(only: [:update, :destroy]) { is_user_owner @resturant.user_id }

  # GET /resturants
  # GET /resturants.json
  def index
    @resturants = Resturant.paginate(:page => params[:page], :per_page => 3)

    respond_to do |format|
      format.html # both.html.erb
      format.json {render json: @resturants}
    end
  end

  # GET /resturants/1
  # GET /resturants/1.json
  def show
    @rat = @resturant.ratings

    respond_to do |format|
      format.html # show.html.erb
      format.json {render json: @resturant}
    end
  end

  # GET /resturants/new
  # GET /resturants/new.json
  def new
    @resturant = Resturant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json {render json: @resturant}
    end
  end

  # GET /resturants/1/edit
  def edit

  end

  # POST /resturants
  # POST /resturants.json
  def create
      @resturant = Resturant.new(params[:resturant])
      @resturant.update_attribute(:user_id, current_user.id)

      respond_to do |format|
        if @resturant.save
          format.html {redirect_to @resturant, notice: 'Resturant was successfully created.'}
          format.json {render json: @resturant, status: :created, location: @resturant}
        else
          format.html {render action: "new"}
          format.json {render json: @resturant.errors, status: :unprocessable_entity}
        end
      end
  end

  # PUT /resturants/1
  # PUT /resturants/1.json
  def update
      respond_to do |format|
        if @resturant.update_attributes(params[:resturant])
          format.html {redirect_to @resturant, notice: 'Resturant was successfully updated.'}
          format.json {head :no_content}
        else
          format.html {render action: "edit"}
          format.json {render json: @resturant.errors, status: :unprocessable_entity}
        end
      end
  end

  # DELETE /resturants/1
  # DELETE /resturants/1.json
  def destroy
    @resturant.destroy
    redirect_to resturants_url
  end

end
