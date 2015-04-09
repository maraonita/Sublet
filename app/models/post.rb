class Post < ActiveRecord::Base
  belongs_to :user
  validates :price, :start_lease, :end_lease, :neighborhood_id, presence: true
  default_scope { order('price ASC') }
  dragonfly_accessor :image
  validates :image, presence: true
  validates_size_of :image, maximum: 2.megabytes,
                    message: "should be no more than 2 MB", if: :image_changed?
  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?

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