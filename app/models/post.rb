class Post < ApplicationRecord
  belongs_to :wall
  belongs_to :user
  has_one_attached :file

  validates :content, presence: true, length: { minimum: 10, maximum: 1000}
end
