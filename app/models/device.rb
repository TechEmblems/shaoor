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
  #attr_accessible :user, :user_id, :type, :status, :key, :company, :model

  #validates :type, :status, presence: true
  #validates :key, presence: true, uniqueness: true

  belongs_to :user
end
