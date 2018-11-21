class Person < ApplicationRecord
  has_many :assignments
  has_many :teams, through: :assignments

  def active_assignments
    assignments.active
  end

  def assign_to team, effective_date = Week.current
    assignments.create(team: team, effective_date: effective_date)
  end
end
