class CreateUsersEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :users_events do |t|
      t.integer :event_id, null: false
      t.uuid :user_id, default: "uuid_generate_v4()",null: false
      t.timestamps null: false
    end
    add_index :users_events, :user_id
    add_index :users_events, :event_id
  end
end
