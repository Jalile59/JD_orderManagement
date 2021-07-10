class CreateActivityOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_orders do |t|
      t.string :changeDescription
      t.string :description
      t.string :filename
      t.date :dateCreated
    end
  end
end
