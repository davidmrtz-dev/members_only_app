class AddPasswordTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_token, :string
  end
end
