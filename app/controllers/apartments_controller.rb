class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all
    # add in the pin drop from the show page to make a multiple pin drops for all apartments
    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  @apartments = Apartment.find(params[:id]) #@apartments may also be found using the set_apartment method provided by scaffolding
    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

# add in the map location method to call on it in the js file : render the json object
  def map_location
    @apartment = Apartment.find(params[:apartment_id])
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
    render json: @hash.to_json
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:latitude, :longitude, :address1, :address2, :city, :postal_code, :state, :country, :owner_name, :contact_time, :phone_number)
    end
end
