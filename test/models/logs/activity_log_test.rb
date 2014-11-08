# == Schema Information
#
# Table name: logs_activity_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Logs::ActivityLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
