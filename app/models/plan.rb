class Plan < ApplicationRecord
  belongs_to :project
  belongs_to :team

  scope :current_plan, -> { for_week(Week.current) }
  scope :for_week, -> (week) { where(week: week)}
end
