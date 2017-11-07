class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    temp_genres = params[:profile][:genres]
    params[:profile].delete("genres")

    @profile = Profile.new(profile_params)
    @profile.user = current_user
    temp_genres.each{|genre_id|
      @profile.genres << Genre.find(genre_id) unless genre_id.blank?
    }


    respond_to do |format|
      if @profile.save
        format.html { redirect_to charges_path, notice: 'Profile was successfully created.' }
        format.json { render root_path, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    @profile.genres = [] unless params[:profile][:genres].count == 1

    temp_genres = params[:profile][:genres]
    params[:profile].delete("genres")

    temp_genres.each{|genre_id|
      @profile.genres << Genre.find(genre_id) unless genre_id.blank?
    }

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render root_path, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :brand, :location, :phone_number, :image, :bio, :genres => [])
    end
end
