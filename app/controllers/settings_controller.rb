class SettingsController < ApplicationController
  def general
    @settings = Settings.getInstance
    if request.post?
      @settings.update_attributes(params[:settings])
      @settings.save!
    end
  end

  def calibration

  end
end
