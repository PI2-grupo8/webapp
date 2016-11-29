class AddsCalibrationSettingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :calibration_settings do |t|
      t.string :calibration_values, default: ""
      t.boolean :calibration_calculated, default: false
      t.timestamps
    end
  end
end
