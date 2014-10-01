# == Schema Information
#
# Table name: contact_informations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  type       :string(255)      not null
#  value      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactInformation < ActiveRecord::Base
  self.inheritance_column = nil
  TYPE = %w[Phone Address]
  attr_accessible :user, :user_id, :value, :type

  belongs_to :user
end
