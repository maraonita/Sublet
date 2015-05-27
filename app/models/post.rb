class Post < ActiveRecord::Base
  belongs_to :user
	has_many :photos
	 accepts_nested_attributes_for :photos
  validates :price, :start_lease, :end_lease, :neighborhood_id, presence: true
  default_scope { order('price ASC') }

	def book!
		self.update_attributes(booked: true)
	end

  def neighborhood_name
    Neighborhood.find(neighborhood_id).name
  end

  def bed_size_name
    BedSize.find(bed_size_id).name
  end

  def room_type_name
    RoomType.find(room_type_id).name
  end

  def housing_type_name
    HousingType.find(housing_type_id).name
  end

  def self.checkbox_value_symbols
    [:heating, :electricity, :elevator, :hot_water, :air_conditioning, :doorman, :buzzer, :intercom, :cable, :internet, :smoking, :pool, :gym, :washer, :dryer, :balcony, :furnished, :unfurnished]
  end

  def checked_items
    Post.checkbox_value_symbols.select{|param| send(param)}
  end

  def self.search_between_dates(start_lease=nil, end_lease=nil, neighborhood_id=nil)
    if start_lease && end_lease && neighborhood_id
      where("start_lease >= ?", start_lease).where("end_lease <= ?", end_lease).where(neighborhood_id: neighborhood_id)
    else
      Post.all
    end
  end
end
