class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references :person, polymorphic: true
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
