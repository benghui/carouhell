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

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions
  
  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
    existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end

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