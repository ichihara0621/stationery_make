class AddPaidNumberIdToBuyItems < ActiveRecord::Migration[5.1]
  def change
    add_column :buy_items, :paid_number_id, :integer
  end
end
