class CreateBuyItems < ActiveRecord::Migration[5.1]
  def change
    create_table :buy_items do |t|
      t.integer :count
      t.integer :send_status
      t.integer :receive
      t.references :stationery, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
