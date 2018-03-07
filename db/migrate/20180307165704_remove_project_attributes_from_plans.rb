class RemoveProjectAttributesFromPlans < ActiveRecord::Migration[5.1]
  def change
    remove_column :plans, :project
    remove_column :plans, :project_due
    remove_column :plans, :project_status
  end
end
