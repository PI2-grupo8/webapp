class Measurement < ApplicationRecord
  # require 'csv'
  #
  # def self.import(file)
  #   CSV.foreach(public/measurements/mock.csv, headers: true) do |row|
  #     Measurement.create! row.to_hash
  #   end
  # end

  require 'smarter_csv'

    options = {}
    SmarterCSV.process('public/measurements/mock.csv', options) do |chunk|
      chunk.each do |data_hash|
        Measurement.create!( data_hash )
      end
    end

end
