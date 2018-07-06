class UsersPasswordDigesToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_diges, :password_digest
  end
end
