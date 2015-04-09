class RoomType < ActiveRecord::Base
  self.table_name = "room_type"
  validates :name, uniqueness: true
end
