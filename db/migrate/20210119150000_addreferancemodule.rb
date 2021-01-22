class Addreferancemodule < ActiveRecord::Migration[5.2]
    def change
      add_reference :order_tracks, :devices, foreign_key: true
    end
  end
  