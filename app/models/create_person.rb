class CreatePerson
  def initialize(attributes)
    Person.create(attributes)
  end
end