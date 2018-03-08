class AddTeamStringToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :team, :string
  end
end
