class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    change_column :posts, :price, :decimal
  end
end
