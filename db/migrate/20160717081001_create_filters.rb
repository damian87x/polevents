class CreateFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :filters do |t|
      t.uuid :user_id, default: "uuid_generate_v4()",null: false
      t.integer :owner_id

      t.timestamps
    end
  end
end
