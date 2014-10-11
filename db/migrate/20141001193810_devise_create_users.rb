class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string  :name,              null: false, default: ''
      t.string  :father_name,       default: nil
      t.integer :cnic,              default: nil, limit: 8
      t.integer :phone,             default: nil, limit: 6
      t.string  :address,           default: nil
      t.string :role,              null: false, default: 'Consumer'
      t.boolean :terms,             default: false
      t.boolean :completed_profile, default: false

      t.timestamps
    end
    User.create(name: 'RD Administrator', email: 'admin@regdevice.com', password: 'rd.admin', confirmation_token: nil, confirmed_at: Time.now, phone: '090078601', address: 'regdevice.com', role: 'Admin', terms: true, completed_profile: true)

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
