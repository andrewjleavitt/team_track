class AddProjectIdAndTeamIdToPlan < ActiveRecord::Migration[5.1]
  def change
    add_reference :plans, :project, foreign_key: true
    add_reference :plans, :team, foreign_key: true
  end
end
