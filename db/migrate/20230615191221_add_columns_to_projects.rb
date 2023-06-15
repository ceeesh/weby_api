class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :priority, :string
  end
end
