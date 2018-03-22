class Plan < ApplicationRecord
  belongs_to :project
  belongs_to :team

  scope :for_week, -> (week) { where(week: week)}
  scope :current_plan, -> { for_week(Week.current) }
end
