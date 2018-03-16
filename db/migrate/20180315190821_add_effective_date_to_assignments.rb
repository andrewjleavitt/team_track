class AddEffectiveDateToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :effective_date, :date
    add_column :assignments, :completion_date, :date
  end
end
