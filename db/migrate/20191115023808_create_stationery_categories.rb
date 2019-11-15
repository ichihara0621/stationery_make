class CreateStationeryCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :stationery_categories do |t|
      t.references :stationery, foreign_key: true
      t.references :ranking, foreign_key: true

      t.timestamps
    end
  end
end
