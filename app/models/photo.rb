class Photo < ActiveRecord::Base
	belongs_to :post
	dragonfly_accessor :image
  validates :image, presence: true
  validates_size_of :image, maximum: 2.megabytes,
                    message: "should be no more than 2 MB", if: :image_changed?
  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?

end
