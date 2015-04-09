class RenameRoomTypes < ActiveRecord::Migration
  def up
    rename_table :room_types, :room_type
  end 

  def down
    rename_table :room_type, :room_types
  end
end
