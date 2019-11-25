require "csv"

class BatchCreateTeam
  def initialize(path)
    options = {headers: true, header_converters: :symbol}
    CSV.foreach(path, options).pluck(:team).uniq.each {|team| CreateTeam.new(name: Team) }
  end
end