class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.references :pro, foreign_key: true
      t.string :name
      t.string :phone
      t.string :shift

      t.timestamps
    end
  end
end
