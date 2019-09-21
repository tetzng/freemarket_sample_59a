class Profiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id, :null false
      t.text    :content
    end
  end
end
