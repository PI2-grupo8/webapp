class SettingsController < ApplicationController
  def index
  end

  def create
    @settings.update_attributes(params[:settings])
    redirect_to "/general"
  end

  def general
    @settings = Settings.last || Settings.instance
    if request.post?
      @settings.update_attributes(params[:settings])
      @settings.save!
    end
  end

  def sensor

  end

end
