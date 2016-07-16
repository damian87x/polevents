class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name
      t.datetime :start_time
      t.integer :city_id
      t.uuid :user_id, default: "uuid_generate_v4()"
      t.integer :topic_id

      t.timestamps
    end
  end
end
