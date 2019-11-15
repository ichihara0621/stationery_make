class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :total_count
      t.references :stationery, foreign_key: true

      t.timestamps
    end
  end
end
