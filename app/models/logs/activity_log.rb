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

class Logs::ActivityLog < ActiveRecord::Base
  belongs_to :user
end
