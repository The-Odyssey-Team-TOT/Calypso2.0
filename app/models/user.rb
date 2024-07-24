class User < ApplicationRecord
  has_one_attached :photo
  has_many :chatrooms
  has_many :posts, through: :wall
  has_many :messages
  has_many :notifications, as: :recipient

  validates :nickname, :spoken_language, :learning_language, :description, presence: true
  validates :description, length: {minimum: 15, maximum: 300}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
