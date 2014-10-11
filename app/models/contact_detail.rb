class ContactDetail < ActiveRecord::Base
  self.inheritance_column = nil
  TYPE = %w[Phone Address]

  belongs_to :user
end
