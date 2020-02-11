class Category < ApplicationRecord
  has_many :posts
  before_save :create_slug

  validates  :title, presence: true
  validates  :title, uniqueness: true

  def create_slug
    self.slug = self.title.downcase.tr(" ", "-")
  end
end
