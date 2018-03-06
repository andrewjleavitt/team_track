class AddTeamToMember < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :team, foreign_key: true
    Member.all.each do |member|
      team = Team.find_by(name: member.team)
      member.update_attributes(team_id: team.id) unless team.nil?
    end
  end
end
