class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :pro, foreign_key: true
      t.references :user, foreign_key: true
      t.references :mission, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.datetime :start_time
      t.datetime :end_time
      t.string :status, default: 'pending'
      t.text :comment

      t.timestamps
    end
  end
end
