class Ticket < ActiveRecord::Base
  self.inheritance_column = nil
  TYPE = %w[Sale Technical Development]
  STATUS = %W[Open Pending Closed Hold]


  belongs_to :user
  belongs_to :agent, class: 'User', foreign_key: :agent_id
  has_many :responses

end
