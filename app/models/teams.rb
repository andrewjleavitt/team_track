class Teams
  def self.unique
    Plan.all.pluck(:team).uniq
  end
end
