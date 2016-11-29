class Measurement < ApplicationRecord
  require 'smarter_csv'

  def self.import(file)

    Measurement.delete_all

    options = {}
    SmarterCSV.process('public/measurements/mock.csv', options) do |chunk|
      chunk.each do |data_hash|
        data_hash.delete(:coleta)
        Measurement.create!( data_hash )
      end
    end
  end
end
