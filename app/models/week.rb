class Week
  def self.weeks
    (-2..4).map {|i| Date.today.beginning_of_week + i.weeks}
  end

  def self.current
    Date.today.beginning_of_week
  end

  def self.for_date date
    new(Date.parse(date).beginning_of_week)
  end

  def self.between start_date, end_date
    (start_date..end_date).select(&:monday?).map {|monday| new(monday)}
  end

  def initialize week
    @week = week.beginning_of_week
  end

  def start
    @week
  end

  def end
    @week.end_of_week
  end

  def display
    @week.strftime("%F")
  end

  def == other
    @week.strftime("%F") == other.display
  end
end
