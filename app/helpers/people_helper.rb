module PeopleHelper
  def person_assignments_list person
    person.assignments.map {|a| a.team.name }.join(", ")
  end
end