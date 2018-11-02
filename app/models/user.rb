class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  has_many :comments
  has_many :products, foreign_key: "seller_id"
  has_many :products, foreign_key: "buyer_id"
  has_many :chatrooms, dependent: :destroy

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def seller_products
    Product.where("seller_id = ?", self.id)
  end

  def buyer_products 
    Product.where("buyer_id = ?", self.id)
  end
end