class DeviseTokenAuthCreatePros < ActiveRecord::Migration[5.1]
  def up
    add_column :pros, :provider, :string, null: false, default: 'email'
    add_column :pros, :uid, :string, null: false, default: ''
    add_column :pros, :tokens, :text
    add_column :pros, :confirmation_token, :string
    add_column :pros, :confirmed_at, :datetime
    add_column :pros, :confirmation_sent_at, :datetime
    add_column :pros, :unconfirmed_email, :string
    add_column :pros, :failed_attempts, :integer, default: 0, null: false
    add_column :pros, :unlock_token, :string
    add_column :pros, :locked_at, :datetime

    # inspired by https://github.com/lynndylanhurley/devise_token_auth/issues/181
    Pro.reset_column_information
    Pro.find_each do |pro|
      pro.uid = pro.email
      pro.provider = 'email'
      pro.save!
    end

    add_index :pros, [:uid, :provider], unique: true
    add_index :pros, :confirmation_token, unique: true
    add_index :pros, :unlock_token, unique: true
  end

  def down
    remove_columns :pros, :provider, :uid, :tokens, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at
    remove_index :pros, name: :index_pros_on_uid_and_provider
  end
end
