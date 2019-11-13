class CreateStationeries < ActiveRecord::Migration[5.1]
  def change
    create_table :stationeries do |t|
      t.string :name
      t.integer :price
      t.string :maker
      t.text :detail

      t.timestamps
    end
  end
end
