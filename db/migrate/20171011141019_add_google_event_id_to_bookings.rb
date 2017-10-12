class AddGoogleEventIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :google_event_id, :string
  end
end
