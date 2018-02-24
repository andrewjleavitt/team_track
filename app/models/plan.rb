class Plan < ApplicationRecord

  scope :current_plan, -> { where(week: Date.today.beginning_of_week)}

  def self.weeks
    (-2..4).map { |i| Date.today.beginning_of_week + i.weeks }
  end
end
