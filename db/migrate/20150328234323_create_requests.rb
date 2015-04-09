class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :seller_user_id
      t.integer :buyer_user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
