class AddsSettingsModel < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|

      t.string :ip_address, default: "10.0.0.3"
      t.integer :tcp_port, default: 4000
      t.integer :ftp_port, default: 5000
      t.integer :measurements_distance
      t.integer :amount_of_measurementes
      t.integer :amount_of_rows
    end
  end
end
