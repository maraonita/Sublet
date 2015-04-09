class AddImageUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_uid, :string, default: '', null: false
  end
end
