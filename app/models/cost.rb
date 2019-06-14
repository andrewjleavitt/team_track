class Cost
  def self.for(project)
    new(project)
  end

  def cost
    engineer_weeks * Rate.weekly
  end

  private

  def initialize(project)
    @project = project
  end

  def engineer_weeks
    return 0 if @project.start_at.nil?
    return 0 if @project.team.nil?

    project_weeks = Week.between(@project.start_at, complete_week)
    project_weeks.map {|week| engineers_for_week(week.start)}.sum
  end

  def engineers_for_week(date)
    @project.team.active_assignments(date).count
  end

  def complete_week
    @project.complete_at.present? ? @project.complete_at : Week.current
  end
end
