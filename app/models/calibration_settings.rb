class CalibrationSettings < ApplicationRecord

  belongs_to :settings
  after_save :calculate
  serialize :calibration_values, Hash

  def calculate

  end
end
