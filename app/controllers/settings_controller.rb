class SettingsController < ApplicationController
  def general
    @settings = Settings.last || Settings.instance
    if request.post?
      @settings.update_attributes(params[:settings])
      @settings.save!
    end
  end

  def calibration

  end
end
