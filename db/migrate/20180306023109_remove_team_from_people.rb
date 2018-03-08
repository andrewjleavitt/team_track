class RemoveTeamFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :team
  end
end
