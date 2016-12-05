class AddsCalibrationSettingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :calibration_settings do |t|
      t.text :calibration_values, default: ""
      t.float :paramA, default: 0
      t.float :paramB, default: 0
      t.boolean :calibration_calculated, default: false
      t.timestamps
    end
  end
end
