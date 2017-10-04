class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :sender, polymorphic: true
      t.references :recipient, polymorphic: true

      t.timestamps
    end
  end
end
