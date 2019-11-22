class CreateBuyItems < ActiveRecord::Migration[5.1]
  def change
    create_table :buy_items do |t|
      t.integer :count
      t.boolean :send_status, default: true
      t.boolean :receive, default: true
      t.references :user, foreign_key: true
      t.references :stationery, foreign_key: true

      t.timestamps
    end
  end
end
