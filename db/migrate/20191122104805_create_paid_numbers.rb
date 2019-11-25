class CreatePaidNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :paid_numbers do |t|

      t.timestamps
    end
  end
end
