class CreateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :value
      t.datetime :updateDate
    end
  end
end
