class AddColumnToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :birthday, :string
    add_column :clients, :gender, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :country, :string
  end
end
