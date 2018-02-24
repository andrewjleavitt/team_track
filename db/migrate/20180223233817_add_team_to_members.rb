class AddTeamToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :team, :string
  end
end
