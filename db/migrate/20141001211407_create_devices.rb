class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type,     null: false
      t.string :status
      t.references :user, index: true
      t.integer :key,     null: false, limit: 8
      t.string :company
      t.string :model

      t.timestamps
    end
  end
end
