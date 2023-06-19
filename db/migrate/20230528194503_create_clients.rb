class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :token
      t.string :birthday
      t.string :gender
      t.string :country
      t.string :phone_number
      t.boolean :admin, default: false
      t.boolean :verified, default: false
      
      t.timestamps
    end
  end
end
