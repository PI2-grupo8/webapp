class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.all
  end

  def import
    Measurement.import(params[:file])
    redirect_to measurements_url
  end

  def humidity_heatmap
    @measurements = Measurement.all

    latitude_array = []
    longitude_array = []
    humidity_array = []

    @measurements.each_with_index do |measurement, humidity_heatmap|
      latitude_array.append(measurement.latitude)
      longitude_array.append(measurement.longitude)
      humidity_array.append(measurement.absolute_humidity)
    end

    @js_lat = latitude_array
    @js_long = longitude_array
    @js_humidity = humidity_array

  end
end
