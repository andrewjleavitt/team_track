module PeopleHelper
  def person_assignments_list person
    Assignment.active_assignment_for_person(person).map {|a| a.team.name }.join(", ")
  end
end