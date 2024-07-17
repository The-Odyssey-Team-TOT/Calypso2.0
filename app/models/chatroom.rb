class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users
  has_many :posts, through: :wall
  has_one_attached :photo

  validates :name, :status, :language, :
end
