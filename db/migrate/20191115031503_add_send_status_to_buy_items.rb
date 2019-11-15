class AddSendStatusToBuyItems < ActiveRecord::Migration[5.1]
  def change
    add_column :buy_items, :send_status, :boolean
  end
end
