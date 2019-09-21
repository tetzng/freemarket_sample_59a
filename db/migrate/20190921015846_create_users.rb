class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :createusers do |t|
      t.text    :nickname,               null: false, unique: true, index: true
      t.integer :email,              null: false, default: ""
      t.integer :encrypted_password, null: false, default: ""
      t.text    :first_name
      t.text    :last_name
      t.text    :first_name_kana
      t.text    :last_name_kana
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :birthday_day
      t.integer :phone_num
      t.integer :authentication_num

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      # ## Rememberable
      # t.datetime :remember_created_at

      # ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.

      t.timestamps null: false
  　end
    
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  　　
  end
end
