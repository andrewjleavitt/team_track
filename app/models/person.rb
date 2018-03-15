class Person < ApplicationRecord
  has_many :assignments
  has_many :teams, through: :assignments

  def current_assignments
    self.assignments
  end
end
