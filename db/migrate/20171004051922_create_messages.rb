class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :sender, polymorphic: true
      t.references :conversation, foreign_key: true
      t.text :body
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
