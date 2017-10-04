class AddAvatarToPros < ActiveRecord::Migration[5.1]
  def change
    add_column :pros, :avatar, :string
  end
end
