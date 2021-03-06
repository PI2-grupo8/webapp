class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.integer :started_at
      t.time    :gathering_time
      t.date    :gathering_date
      t.float   :latitude
      t.float   :longitude
      t.float   :absolute_humidity
      t.float   :air_humidity
      t.float   :air_temperature
      t.timestamps
    end
  end
end
