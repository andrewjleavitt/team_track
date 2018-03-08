class RenameMemberToPerson < ActiveRecord::Migration[5.1]
  def change
    rename_table :members, :people
  end
end
