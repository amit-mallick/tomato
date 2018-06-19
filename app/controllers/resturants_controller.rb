class ResturantsController < ApplicationController

  before_filter :current_user, only: [:destroy, :create, :new, :edit, :update]

  # GET /resturants
  # GET /resturants.json
  def index
    @resturants = Resturant.all

    respond_to do |format|
      format.html # both.html.erb
      format.json {render json: @resturants}
    end
  end

  # GET /resturants/1
  # GET /resturants/1.json
  def show
    @resturant = Resturant.find(params[:id])

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
    @resturant = Resturant.find(params[:id])
  end

  # POST /resturants
  # POST /resturants.json
  def create

    if current_user
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
    else
      render text: "Login kr le"
    end
  end

  # PUT /resturants/1
  # PUT /resturants/1.json
  def update
    @resturant = Resturant.find(params[:id])

    if current_user.id == @resturant.user_id
      respond_to do |format|
        if @resturant.update_attributes(params[:resturant])
          format.html {redirect_to @resturant, notice: 'Resturant was successfully updated.'}
          format.json {head :no_content}
        else
          format.html {render action: "edit"}
          format.json {render json: @resturant.errors, status: :unprocessable_entity}
        end
      end
    else
      render text: "You can't edit this Resturant, as you aren't the owner of this Resturant"
    end
  end

  # DELETE /resturants/1
  # DELETE /resturants/1.json
  def destroy
    if current_user
      @resturant = Resturant.find(params[:id])
      if current_user.id == @resturant.user_id
        @resturant.destroy
        redirect_to resturants_url
      else
        render text: "You aren't the owner of this Resturant!!"
      end
    else
      render text: "login kr le"
    end
  end

end
