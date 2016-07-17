class AddMissingIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :filters, :user_id
    add_index :filters, [:owner_id, :owner_type]
    add_index :events, :user_id
    add_index :events, :topic_id
    add_index :events, :city_id
  end
end
