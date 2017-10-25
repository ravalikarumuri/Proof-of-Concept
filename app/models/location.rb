class Location < ActiveRecord::Base
  belongs_to :company
  has_many :user_locations
  has_many :users,through: :user_locations
  validates :name, uniqueness: true
end
