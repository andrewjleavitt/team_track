class Assignment < ApplicationRecord
  belongs_to :team
  belongs_to :person

  scope :active, ->(week = Date.today) {
    where("effective_date <= ? and coalesce(completion_date, ?) > ?", week, 20_000.years.from_now, week)
  }
end
