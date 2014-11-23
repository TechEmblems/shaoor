class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.string :type
      t.string :status
      t.integer :agent_id
      t.integer :user_id

      t.timestamps
    end
  end
end
