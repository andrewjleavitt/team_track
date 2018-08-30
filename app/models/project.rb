class Project < ApplicationRecord
  validates :name, presence: true
  belongs_to :team, optional: true

  scope :for_week, -> (week) {where("start_at <= ? and complete_at is null", week)}

  def self.status_options
    %w[Green Yellow Red]
  end

  def team_name
    team.nil? ? "Unassigned" : team.name
  end

  def assign_to(team)
    self.team = team
    self.save
  end

  def start(week=Week.current)
    self.start_at = week
    self.save
  end

  def complete
    self.complete_at = Date.today
    self.save
  end
end
