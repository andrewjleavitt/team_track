class RemoveTeamStringFromPlans < ActiveRecord::Migration[5.1]
  def change
    remove_column :plans, :team
  end
end
