class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :title, presence: true, uniqueness: true, case_sensitive: false
  before_validation :sanitize, :slugify

  def to_param
    self.slug
  end

  def slugify
    self.slug = self.title.downcase.gsub(" ", "-")
  end

  def sanitize
    self.title = self.title.strip
  end
end
