class Project < ApplicationRecord
  validates :name, presence: true
  belongs_to :team, optional: true

  def self.status_options
    %w[Green Yellow Red]
  end

  def team_name
    team.nil? ? "Unassigned" : team.name
  end
end
