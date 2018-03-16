class Assignment < ApplicationRecord
  belongs_to :team
  belongs_to :person

  def self.active_assignment_for person
    self.where("person_id=? and ? between effective_date and completion_date", person.id, Date.today)
  end
end
