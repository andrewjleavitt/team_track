class RemoveTeamIdFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :team_id
  end
end
