class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :text
    add_column :users, :uid, :text
  end
end
