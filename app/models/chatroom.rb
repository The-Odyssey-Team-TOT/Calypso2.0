class Chatroom < ApplicationRecord
  before_save :status

  include PgSearch::Model
  pg_search_scope :search_by_name_and_topic_and_language_and_language_level,
                  against: [:name, :topic, :language, :language_level],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :messages
  has_many :users
  has_many :posts, through: :wall
  has_one_attached :photo
  has_one :wall, dependent: :destroy
  has_many :invites, as: :invitable
  LANGUAGE_LEVEL = ["beginner", "medium", "advanced", "fluent"]
  validates :name, :status, :language, :language_level, presence: true
  validates :language_level, inclusion: { in: LANGUAGE_LEVEL }

  private

  def self.status
    if self.password.present?
      self.status == "private"
    else
      self.status == "public"
    end
  end

end
