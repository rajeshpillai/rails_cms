class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_rich_text :content
  validates  :title, presence: true

  def all_tags=(names)
    if names.blank? 
        return
    end
    self.tags = names.split(",").map do |name|
      unless name.blank? 
        Tag.where(name: name.strip).first_or_create!
      end
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
