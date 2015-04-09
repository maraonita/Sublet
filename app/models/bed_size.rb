class BedSize < ActiveRecord::Base
  validates :name, uniqueness: true
end
