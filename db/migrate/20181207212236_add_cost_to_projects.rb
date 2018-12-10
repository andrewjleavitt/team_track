class AddCostToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :cost, :integer
  end
end
