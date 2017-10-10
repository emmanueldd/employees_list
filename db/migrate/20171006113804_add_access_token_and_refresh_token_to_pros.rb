class AddAccessTokenAndRefreshTokenToPros < ActiveRecord::Migration[5.1]
  def change
    add_column :pros, :access_token, :string
    add_column :pros, :refresh_token, :string
  end
end
