class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :token
      t.boolean :verified, default: false
      
      t.timestamps
    end
  end
end
