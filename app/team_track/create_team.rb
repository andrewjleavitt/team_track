  class CreateTeam
    def  initialize(attributes)
      team = Team.find_or_create_by(attributes)
      team
    end
  end