class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /offers
  # GET /offers.json
  def index
    @offers = []
    @bookings =[]
    @tours = Tour.where(user_id: current_user)
    @tours.each{|tour|
      @offers << Offer.where(tour_id: tour.id)
      @bookings << Booking.where(tour_id: tour.id)
    }
    @cal = Calendar
    @max  = find_max_index(@offers).last
    @min  = find_max_index(@offers).first

    @madeOffers = Offer.where(user_id: current_user.id)
    




    # @impressions = @tour.impressionist_count

  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id if current_user
    respond_to do |format|
      if @offer.save
        format.html { redirect_to tour_url(@offer.tour_id), notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        puts "#{params}".red
        format.html { redirect_to tour_url(@offer.tour_id), notice: 'offer was unsuccessful due to reasons'}
        format.json { render json: @offer.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:tour_id, :user_id, :date, :price, :location)
    end
end
