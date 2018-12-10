class Project < ApplicationRecord
  validates :name, presence: true
  belongs_to :team, optional: true
  belongs_to :project_category, optional: true

  scope :for_week, ->(week) {where("start_at <= ? and coalesce(complete_at, ?) > ?", week, Week.current + 1000.years, week)}

  def self.status_options
    %w[Green Yellow Red]
  end

  def team_name
    team.nil? ? "Unassigned" : team.name
  end

  def project_category_name
    project_category.nil? ? "No Category Assigned" : project_category.name
  end

  def assign_to(team)
    self.team = team
    save
  end

  def start(week = Week.current)
    self.start_at = week
    save
  end

  def complete
    self.complete_at = Date.today
    save
  end
end
