class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :client, null: false, foreign_key: true
      t.boolean :status, default: false
      t.string :description
      t.string :priority
      t.string :duration
      t.datetime :start_date
      t.datetime :end_date
      t.integer :booking_id

      t.timestamps
    end
  end
end