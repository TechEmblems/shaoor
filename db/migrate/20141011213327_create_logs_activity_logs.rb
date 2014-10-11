class CreateLogsActivityLogs < ActiveRecord::Migration
  def change
    create_table :logs_activity_logs do |t|
      t.references :user, index: true
      t.string :type

      t.timestamps
    end
  end
end
