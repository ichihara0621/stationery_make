class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :count
      t.references :stationery, foreign_key: true

      t.timestamps
    end
  end
end
