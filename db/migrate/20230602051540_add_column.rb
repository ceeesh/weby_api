class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :user_role, :string, default: 'client'
    add_column :devs, :user_role, :string, default: 'dev'
  end
end
