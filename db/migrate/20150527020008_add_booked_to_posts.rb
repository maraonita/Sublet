class AddBookedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :booked, :boolean, default: false
  end
end
