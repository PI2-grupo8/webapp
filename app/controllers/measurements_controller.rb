class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.all
  end

  def import
    Measurement.import(params[:file])
    redirect_to measurements_url
  end

  def humidity_heatmap

  end
end
