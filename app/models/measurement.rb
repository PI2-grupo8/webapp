class Measurement < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Measurement.create! row.to_hash
    end
  end
end
