class AddRoleToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :role, :string
  end
end
