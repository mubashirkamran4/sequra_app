class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :merchant_id, null: false
      t.integer :shopper_id, null: false
      t.float :amount, null: false
      t.float :disbursement_amount
      t.datetime :completed_at
      t.timestamps
    end
  end
end
