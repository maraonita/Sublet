class University < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :name, presence: true
    belongs_to :user
end
