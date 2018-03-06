class RemoveTeamFromMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :team
  end
end
