class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :description
      t.integer :ticket_id
      t.integer :user_id
      t.boolean :read

      t.timestamps
    end
  end
end
