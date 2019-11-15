class AddReceiveToBuyItems < ActiveRecord::Migration[5.1]
  def change
    add_column :buy_items, :receive, :boolean
  end
end
