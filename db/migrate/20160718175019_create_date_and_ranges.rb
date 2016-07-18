class CreateDateAndRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :date_and_ranges do |t|
      t.date :start_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :name, default: 'DateAndRange'

      t.timestamps
    end
  end
end
