class CreateProject
  def initialize(attributes)
    Project.create!(attributes)
  end
end