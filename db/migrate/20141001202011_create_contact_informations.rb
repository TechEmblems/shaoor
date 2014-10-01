class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.references :user,         index: true, null: false
      t.string :type,             index: true, null: false
      t.string :value,            null: false, default: nil

      t.timestamps
    end
  end
end
