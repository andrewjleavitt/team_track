  class CreateTeam
    def  initialize(attributes)
      team = Team.create(attributes)
      team
    end
  end