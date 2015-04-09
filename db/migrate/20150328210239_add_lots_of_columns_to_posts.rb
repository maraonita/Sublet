class AddLotsOfColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :description, :string, default: ''
    # numbers
    add_column :posts, :num_roommates, :integer, default: 0
    add_column :posts, :num_flatmates, :integer, default: 0
    add_column :posts, :num_baths, :integer, default: 1
    # essentials
    add_column :posts, :heating, :boolean, default: false
    add_column :posts, :electricity, :boolean, default: false
    add_column :posts, :hot_water, :boolean, default: false
    # anemeties
    add_column :posts, :parking, :boolean, default: false
    add_column :posts, :elevator, :boolean, default: false
    add_column :posts, :balcony, :boolean, default: false
    add_column :posts, :washer, :boolean, default: false
    add_column :posts, :dryer, :boolean, default: false
    add_column :posts, :air_conditioning, :boolean, default: false
    add_column :posts, :doorman, :boolean, default: false
    add_column :posts, :buzzer, :boolean, default: false
    add_column :posts, :intercom, :boolean, default: false
    add_column :posts, :cable, :boolean, default: false
    add_column :posts, :internet, :boolean, default: false
    # others
    add_column :posts, :smoking, :boolean, default: false
    add_column :posts, :pool, :boolean, default: false
    add_column :posts, :gym, :boolean, default: false
    # about room
    add_column :posts, :desk, :boolean, default: false
    add_column :posts, :dresser, :boolean, default: false
    add_column :posts, :closet, :boolean, default: false
    # foreign keys
    add_column :posts, :housing_type_id, :integer
    add_column :posts, :room_type_id, :integer
    add_column :posts, :bed_size_id, :integer
  end
end
