# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  status     :string(255)
#  user_id    :integer
#  key        :integer
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
  validates :key, presence: true, uniqueness: true

  belongs_to :user


  def stolen?
    return true if self.status == 'Stolen'
  end
end
