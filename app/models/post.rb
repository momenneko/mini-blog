class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  validates :text, presence: true
end
