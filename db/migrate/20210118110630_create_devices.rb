class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :codearticle
      t.string :name
      t.string :designation
      t.string :project
      t.string :serial
    end
  end
end
