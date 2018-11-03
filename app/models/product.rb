class Product < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category
  has_many :comments
  geocoded_by :address
  after_validation :geocode
end