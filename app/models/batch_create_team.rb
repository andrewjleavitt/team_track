require "csv"

class BatchCreateTeam
  def initialize(path)
    options = {headers: true, header_converters: :symbol}

    teams = teams(options, path)

    teams.each do |team|
      CreateTeam.new(name: team)
    end
  end

  private

  def teams(options, path)
    CSV.read(path, options).pluck(:team).uniq
  end
end