class User < ActiveRecord::Base
  validates :district, format: { with: /\A[1-5][0-9]?\z|\A[6][0-5]?\z/ }, allow_nil: true

  has_many :user_legislators
  has_many :legislators, through: :user_legislators
  has_many :notifications

  scope :gets_notifications, -> { where(receives_notifications: true) }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def send_initial_email
    UserNotifier.send_initial_notification(self).deliver
    self.receives_notifications = true
    notifications.create
  end

  def send_periodic_email
    UserNotifier.send_periodic_notification(self).deliver
    notifications.create
  end

  def due_for_notification?
    Time.now >= last_notification + 2.weeks
  end

  def last_notification
    if receives_notifications
      self.notifications.last.created_at
    end
  end
end
