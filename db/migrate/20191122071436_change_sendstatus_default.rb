class ChangeSendstatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :buy_items, :send_status, from: true, to: false
  end
end
