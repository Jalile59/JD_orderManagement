class AddPartStatusOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :StatusOrders, :priority, :string
  end
end