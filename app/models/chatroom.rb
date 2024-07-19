class Chatroom < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }


  has_many :messages
  has_many :users
  has_many :posts, through: :wall
  has_one_attached :photo
  has_one :wall, dependent: :destroy
  # LANGUAGE_LEVEL = ["beginner", "medium", "advanced", "fluent"]
  # validates :name, :status, :language, :language_level, presence: true
  # validates :language_level, inclusion: { in: LANGUAGE_LEVEL }

end
