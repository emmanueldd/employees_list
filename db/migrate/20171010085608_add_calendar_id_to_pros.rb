class AddCalendarIdToPros < ActiveRecord::Migration[5.1]
  def change
    add_column :pros, :calendar_id, :integer
  end
end
