class Week
  def self.weeks
    (-2..4).map {|i| Date.today.beginning_of_week + i.weeks}
  end

  def self.current
    Date.today.beginning_of_week
  end
end