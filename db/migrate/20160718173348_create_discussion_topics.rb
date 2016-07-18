class CreateDiscussionTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :discussion_topics do |t|
      t.string :name
      t.text :content
      t.integer :event_id
      t.uuid :user_id, default: "uuid_generate_v4()"

      t.timestamps
    end
  end
end
