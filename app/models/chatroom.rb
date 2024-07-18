class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users
  has_many :posts, through: :wall
  has_one_attached :photo


  # LANGUAGE_LEVEL = ["beginner", "medium", "advanced", "fluent"]
  # validates :name, :status, :language, :language_level, presence: true
  # validates :language_level, inclusion: { in: LANGUAGE_LEVEL }
end
