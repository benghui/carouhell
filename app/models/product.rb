class Product < ActiveRecord::Base
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  # has_many :comments
end