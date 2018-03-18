class Team < ApplicationRecord
  has_many :assignments
  has_many :people, through: :assignments

  def active_assignments
    assignments.active
  end
end
