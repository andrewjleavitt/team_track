class Team < ApplicationRecord
  has_many :assignments
  has_many :people, through: :assignments
  has_many :projects

  def active_assignments(week = Week.current)
    assignments.active(week)
  end
end
