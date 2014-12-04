# == Schema Information
#
# Table name: devices
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

class Device < ActiveRecord::Base
  self.inheritance_column = nil
  TYPE = %w[Mobile Laptop Tablet Cameras iPod]
  STATUS = %W[Active Sold Stolen Missing]

  validates :type, presence: true
  validates :key, presence: true

  belongs_to :user
  scope :personal_devices, -> { where(personal: true) }
  scope :other_devices, -> { where(personal: false) }

  after_create :send_notification_email

  def stolen?
    return true if self.status == 'Stolen'
  end

  def send_notification_email
    DeviceMailer.device_registered(self.user, self).deliver
  end
end
