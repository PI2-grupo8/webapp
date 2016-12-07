class Measurement < ApplicationRecord
  require 'smarter_csv'

  def self.import(file)

    Measurement.delete_all

    SmarterCSV.process('public/measurements/03121995_235423.csv', headers_in_file: false, user_provided_headers: %i[started_at gathering_time gathering_date latitude longitude absolute_humidity air_humidity air_temperature]) do |chunk|
      chunk.each do |data_hash|
        Measurement.create!( data_hash )
      end
    end

  end

end
