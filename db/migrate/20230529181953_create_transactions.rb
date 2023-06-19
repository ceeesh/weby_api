class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :price
      t.boolean :status, default: false
      t.references :project, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end