class Member < ApplicationRecord
  belongs_to :team, optional: true

  def current_team
    self.team.present? ? self.team : NoTeamAssigned.new
  end

  class NoTeamAssigned
    def name
      "No Team Assigned"
    end
  end
end
