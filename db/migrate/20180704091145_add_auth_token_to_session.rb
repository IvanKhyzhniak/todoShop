class AddAuthTokenToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :auth_token, :string
  end
end
