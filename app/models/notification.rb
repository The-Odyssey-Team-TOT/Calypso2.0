class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :notifiable, polymorphic: true
end
