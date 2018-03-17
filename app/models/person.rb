class Person < ApplicationRecord
  has_many :assignments
  has_many :teams, through: :assignments

  def active_assignments
    assignments.active
  end
end
