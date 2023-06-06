class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      # t.references :team, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.boolean :status, default: false
      t.integer :start_date
      t.integer :end_date

      t.timestamps
    end
  end
end
