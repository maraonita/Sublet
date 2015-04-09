class RenamePostImageUrlToImageUid < ActiveRecord::Migration
  def up
    rename_column :posts, :image_url, :image_uid
  end

  def down
    rename_column :posts, :image_uid, :image_url
  end
end
