# == Schema Information
#
# Table name: pending_requests
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  status     :string(255)
#  user_id    :integer
#  key        :integer          not null
#  company    :string(255)
#  model      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PendingRequest < ActiveRecord::Base
  self.inheritance_column = nil
  TYPE = %w[Mobile Laptop Tablet Cameras iPod]
  STATUS = %W[Active Sold Stolen Missing]

  validates :type, presence: true
  validates :key, presence: true

  belongs_to :user

  after_create :send_notification_email

  def send_notification_email
    DeviceMailer.pending_request(self.user, self).deliver
  end
end
