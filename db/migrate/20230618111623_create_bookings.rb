class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :notes
      t.string :status, default: 'Pending'
      t.datetime :start_date
      t.datetime :end_date
      t.integer :client_id

      t.timestamps
    end
  end
end


