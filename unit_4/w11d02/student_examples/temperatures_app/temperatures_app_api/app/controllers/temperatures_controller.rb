class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :update]

  # GET /locations/1/temperatures
  def index
    @temperatures = Temperature.where(location_id: params[:location_id])

    render json: @temperatures
  end

  # POST /temperatures
  def create
    @temperature = Temperature.new(temperature_params)
    @temperature.location_id = params[:location_id]

    if @temperature.save
      render json: @temperature, status: :created
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /temperatures/1
  def update
    if @temperature.update(temperature_params)
      render json: @temperature
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def temperature_params
      params.require(:temperature).permit(:average_high_f, :average_low_f)
    end
end
