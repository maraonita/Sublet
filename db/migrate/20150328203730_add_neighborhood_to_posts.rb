class AddNeighborhoodToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :neighborhood_id, :integer, null: :false
  end
end
