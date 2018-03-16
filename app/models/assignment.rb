class Assignment < ApplicationRecord
  belongs_to :team
  belongs_to :person


  def self.active_assignment_for person
    self.where("person_id=?", person.id)
      .where("effective_date < ?", Date.today)
      .where("completion_date is null or completion_date > ?", Date.today)
  end
end
