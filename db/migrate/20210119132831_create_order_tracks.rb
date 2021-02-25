class CreateOrderTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :dateCreated
      t.string :serialNum
      t.string :user
      t.string :description
      t.string :dateSending
      t.string :numberDHL
      t.string :project
      t.string :source
      t.string :destination
      t.string :filename
      t.belongs_to :statusOrders
    end
  end
end
