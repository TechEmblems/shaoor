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

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
