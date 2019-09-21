class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer  :user_id,   null: false, unique: true, index: true
      t.text     :image_1
      t.text     :image_2
      t.text     :image_3
      t.text     :image_4
      t.text     :image_5
      t.text     :image_6
      t.text     :image_7
      t.text     :image_8
      t.text     :image_9
      t.text     :image_10
      t.string   :name,             null: false
      t.text     :description
      t.string   :condition,        null: false
      t.string   :delivery_charge,  null: false
      t.string   :delivery_area,    null: false
      t.string   :delivery_days,    null: false
      t.integer  :price,            null: false
      t.integer  :saler_id,         null: false
      t.string   :status,           null: false

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
