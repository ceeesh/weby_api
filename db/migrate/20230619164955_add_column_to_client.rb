class AddColumnToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :profile_picture_url, :string
  end
end
