class CalibrationSettings < ApplicationRecord

  belongs_to :settings

  after_save :calculate

  def calculate

  end
end
