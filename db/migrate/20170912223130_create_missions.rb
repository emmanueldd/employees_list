class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.integer :parent_id, foreign_key: true
      t.references :pro, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :duration
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
