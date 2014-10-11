class Logs::ActivityLog < ActiveRecord::Base
  belongs_to :user
end
