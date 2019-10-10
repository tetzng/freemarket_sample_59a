class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null:false
    add_column :users, :first_name_kana, :string, null:false
    add_column :users, :last_name_kana, :string, null:false
    add_column :users, :birthday_year, :integer, null:false
    add_column :users, :birthday_month, :integer, null:false
    add_column :users, :birthday_day, :integer, null:false
    add_column :users, :phone_num, :integer, null:false
    add_column :users, :authentication_num, :integer, null:false
    add_column :users, :content, :text
  end
end
