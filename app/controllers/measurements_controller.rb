class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.all
  end

  def import
    Measurement.import(params[:file])
    redirect_to root_url, notice: "Measurement data imported!"
  end
end
