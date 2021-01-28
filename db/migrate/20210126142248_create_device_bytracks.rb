class CreateDeviceBytracks < ActiveRecord::Migration[5.2]
  def change
    create_table :device_bytracks do |t|
      t.datetime :created
      t.string :serial
      t.integer :quantity
      t.belongs_to :orderTrack
      t.belongs_to :device
    end
  end
end
