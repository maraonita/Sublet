class HousingType < ActiveRecord::Base
  validates :name, uniqueness: true
end
