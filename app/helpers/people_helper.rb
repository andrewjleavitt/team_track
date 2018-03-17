module PeopleHelper
  def person_assignments_list person
    person.active_assignments.map { |a| a.team.name }.join(", ")
  end
end