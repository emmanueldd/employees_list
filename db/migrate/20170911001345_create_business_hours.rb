class CreateBusinessHours < ActiveRecord::Migration[5.1]
  def change
    create_table :business_hours do |t|
      t.references :pro, foreign_key: true
      t.date :date
      t.integer :week_day
      t.time :start_time
      t.time :end_time
      t.boolean :open, default: true

      t.timestamps
    end
    add_index :business_hours, :open
  end
end
