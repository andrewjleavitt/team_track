class Assignment < ApplicationRecord
  belongs_to :team
  belongs_to :person

  scope :active, ->(week = Date.today) {
    where("effective_date <= ? and coalesce(completion_date, ?) > ?", week, 20_000.years.from_now, week)
  }

  def self.active_assignment_for_person person
    self.where("person_id=? and ? between effective_date and coalesce(completion_date, ?)", person.id, Date.today, 20_000.years.from_now)
  end
end
