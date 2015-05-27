class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
	has_many :payments
  validates :university_id, :first_name, :last_name, :gender, presence: true
  validate :edu_email
  has_one :university
  dragonfly_accessor :image
  validates :image, presence: true
  validates_size_of :image, maximum: 2.megabytes,
                    message: "should be no more than 2 MB", if: :image_changed?

  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?

	def save_customer_id(customer_id)
		self.update_attributes(customer_id: customer_id )
	end

  def university_name
    University.find(university_id).name
  end

  def requests
    Request.where(buyer_user_id: id)
  end

  def incoming_requests
    Request.where(seller_user_id: id, canceled: :false)
  end

private

  def edu_email
     errors.add(:email, "Must be a .edu email") unless email.match(/@.+\.edu\z/)
  end
end
