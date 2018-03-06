class Team < ApplicationRecord

  def self.members_for team_name
    Member.where(team: team_name).map { |member| member }
  end
end
