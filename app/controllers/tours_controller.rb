class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]
  before_action :require_permission, only: :edit

  def require_permission
    if current_user != Tour.find(params[:id]).user
      redirect_to root_path
    end
  end





  # GET /tours
  # GET /tours.json
  def index

    @tours = Tour.all
    if params[:search]
      @tours = Tour.search(params[:search]).order("created_at DESC")
    else
      @tours = Tour.all.order("created_at DESC")
    end



    @cal = Calendar
    puts "hello #{params}"
  end

  # GET /tours/1
  # GET /tours/1.json
  def show


    @bookings = Booking.where(tour_id: params[:id])
    @offers = Offer.where(tour_id: params[:id])
    @offer = Offer.new
    @cal = Calendar
    @booking  = Booking.new

    @days =((@tour.end_date.to_date - @tour.start_date.to_date).to_i)+1
    @impressions = @tour.impressionist_count

    @temp = Booking.where(tour_id: @tour.id)

    @max  = find_max(@offers)
    @h_offer = @offers
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create

    temp_genres = params[:tour][:genres]
    puts "#{temp_genres}".green

    @tour = Tour.new(tour_params)
    @tour.user = current_user
    @tour.country = 'Australia'

    temp_genres.each{|genre_id|
      @tour.genres << Genre.find(genre_id) unless genre_id.blank?
    }

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update

    @tour.genres = [] unless params[:tour][:genres].count == 1

    temp_genres = params[:tour][:genres]
    temp_genres.each{|genre_id|
      @tour.genres << Genre.find(genre_id) unless genre_id.blank?
    }

    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:user_id, :title, :description,  :image, :bio, :start_date, :end_date, :min_cost, :max_cost)
    end
end
