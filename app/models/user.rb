class User < ApplicationRecord
  has_one_attached :photo
  has_many :rooms
  has_many :posts, through: :wall
  has_many :messages

  validates :nickname, :spoken_language, :learning_language, presence: true
  validates :description, length: {minimum: 15, maximum: 300}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
