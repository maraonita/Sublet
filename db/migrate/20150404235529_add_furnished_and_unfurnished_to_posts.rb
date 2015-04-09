class AddFurnishedAndUnfurnishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :furnished, :boolean, default: false
    add_column :posts, :unfurnished, :boolean, default: false
  end
end
