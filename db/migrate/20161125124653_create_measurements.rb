class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.integer :coleta
      t.time :horario
      t.date :dia
      t.float :latitude
      t.float :longitude
      t.float :umidade_solo
      t.float :umidade_solo_calibrada
      t.float :umidade_ar
      t.float :temperatura_ar

      t.timestamps
    end
  end
end
