class AddTeamToPeople < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :team, foreign_key: true
    Person.all.each do |person|
      team = Team.find_by(name: person.team)
      person.update_attributes(team_id: team.id) unless team.nil?
    end
  end
end
