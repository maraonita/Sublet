class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name
      t.integer :size_order, default: 0
      t.timestamps
    end
  end
end
