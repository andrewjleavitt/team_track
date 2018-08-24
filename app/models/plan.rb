class Plan
  def initialize(week=Week.current)
    @week = week
  end

  def projects_for_week
    Project.for_week week
  end

  def week
    @week
  end

end
