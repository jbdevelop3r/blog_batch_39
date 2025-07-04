class Article < ApplicationRecord
  has_many :comments
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments"]
  end
end
