class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :due
      t.integer :amount
      t.string :currency, default: "usd"
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
