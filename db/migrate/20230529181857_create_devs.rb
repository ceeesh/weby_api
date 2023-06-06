class CreateDevs < ActiveRecord::Migration[7.0]
  def change
    create_table :devs do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :password
      t.string :token
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end