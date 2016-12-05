class Settings < ApplicationRecord

  include Singleton

  self.public_class_method :allocate

  has_one :calibration_settings

  def load_settings_from_file

  end

  def restore_default_settings

  end

  def self.getInstance
    Settings.last || Settings.instance
  end

end
