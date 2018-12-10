class ProjectCategory < ApplicationRecord
  has_many :projects

  def total_cost
    projects.sum(:cost)
  end
end
