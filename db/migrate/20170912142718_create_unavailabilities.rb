class CreateUnavailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :unavailabilities do |t|
      t.references :pro, foreign_key: true
      t.datetime :date
      t.integer :week_day
      t.text :hours, array: true, default: []

      t.timestamps
    end
  end
end
