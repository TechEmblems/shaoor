class AddPersonalToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :personal, :boolean, default: true
    add_column :pending_requests, :personal, :boolean, default: true
  end
end
