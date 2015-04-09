class CreateBedSizes < ActiveRecord::Migration
  def change
    create_table :bed_sizes do |t|
      t.string :name
      t.integer :size_order, default: 0
      t.timestamps
    end
  end
end
