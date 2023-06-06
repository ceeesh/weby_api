class AddDurationToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :duration, :string
  end
end
