class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :price
      t.date :start_lease
      t.date :end_lease

      t.timestamps
    end
  end
end
