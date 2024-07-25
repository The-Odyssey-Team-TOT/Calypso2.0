class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :notifiable, polymorphic: true

  
  after_commit -> { NotificationRelayJob.perform_later(self) }
end
