class Measurement < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(public/measurement, headers: true) do |row|
      Measurement.create! row.to_hash
    end
  end
end
