class Person < ApplicationRecord
  has_many :assignments
  has_many :teams, through: :assignments

  def active_assignments
    Assignment.active_assignment_for_person self
  end
end
