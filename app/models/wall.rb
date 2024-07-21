class Wall < ApplicationRecord
  belongs_to :chatroom
  has_many :posts, dependent: :destroy
end
