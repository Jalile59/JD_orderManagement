class AddNotifiedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :notified, :boolean
  end
end
