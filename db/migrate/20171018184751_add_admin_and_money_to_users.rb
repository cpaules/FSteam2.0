class AddAdminAndMoneyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :money, :real, default: 0
    add_column :users, :admin, :boolean, default: false
  end
end
