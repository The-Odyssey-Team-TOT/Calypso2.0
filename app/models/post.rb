class Post < ApplicationRecord
  belongs_to :wall
  belongs_to :user
  has_one_attached :photo
end
