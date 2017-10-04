class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :object, polymorphic: true
      t.string :photo
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
