class CreateOrderTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_tracks do |t|
      t.datetime :dateCreated
      t.string :serialNum
      t.string :user
      t.string :description
      t.string :status
      t.string :dateSending
      t.string :numberDHL
    end
  end
end
