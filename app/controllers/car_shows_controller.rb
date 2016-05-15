class CarShowsController < ApplicationController
  before_action :set_car_show, only: [:show, :edit, :update, :destroy]

  # GET /car_shows
  # GET /car_shows.json
  def index
    @car_shows = CarShow.all
  end

  # GET /car_shows/1
  # GET /car_shows/1.json
  def show
  end

  # GET /car_shows/new
  def new
    @car_show = CarShow.new
  end

  # GET /car_shows/1/edit
  def edit
  end

  # POST /car_shows
  # POST /car_shows.json
  def create
    @car_show = CarShow.new(car_show_params)

    respond_to do |format|
      if @car_show.save
        format.html { redirect_to @car_show, notice: 'Car show was successfully created.' }
        format.json { render :show, status: :created, location: @car_show }
      else
        format.html { render :new }
        format.json { render json: @car_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_shows/1
  # PATCH/PUT /car_shows/1.json
  def update
    respond_to do |format|
      if @car_show.update(car_show_params)
        format.html { redirect_to @car_show, notice: 'Car show was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_show }
      else
        format.html { render :edit }
        format.json { render json: @car_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_shows/1
  # DELETE /car_shows/1.json
  def destroy
    @car_show.destroy
    respond_to do |format|
      format.html { redirect_to car_shows_url, notice: 'Car show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_show
      @car_show = CarShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_show_params
      params.require(:car_show).permit(:start, :end, :name, :street, :city, :state, :zipcode)
    end
end
