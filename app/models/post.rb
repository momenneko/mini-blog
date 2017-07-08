class Post < ApplicationRecord
  has_many :comments
  validates :text, presence: true
end
