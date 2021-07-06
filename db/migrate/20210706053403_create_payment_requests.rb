class CreatePaymentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_requests do |t|
      t.integer :amount, null: false
      t.string :currency, null: false
      t.text :description, null: false
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
