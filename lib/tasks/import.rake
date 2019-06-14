require "csv"
require "rails"

namespace :import do
  desc "Imports Teams from a CSV"
  task :teams, [:path] => :environment do |task, args|
    options = {headers: true, header_converters: :symbol}
    CSV.foreach(args.path, options).pluck(:team).uniq.each do |team|
      Team.find_or_create_by(name: team)
    end
  end

  desc "Imports People from a CSV"
  task :people, [:path] => :environment do |task, args|
    options = {headers: true, header_converters: :symbol}
    CSV.foreach(args.path, options).pluck(:person).uniq.each do |person|
      Person.find_or_create_by(name: person)
    end
  end

  desc "Imports Assignments from a CSV"
  task :assignments, [:path] => :environment do |task, args|
    options = {headers: true, header_converters: :symbol}
    assignments = {}
    CSV.foreach(args.path, options).each do |row|
      person = Person.find_by(name: row[:person])
      team = Team.find_by(name: row[:team])
      start_week = Week.for_date(Date.strptime(row[:week], "%m/%d/%Y").strftime("%F"))
      role = row[:role]

      assignment_attributes = {
        effective_date: start_week,
        person: person,
        team: team,
        role: role,
      }

      if assignments[person].nil?
        assignments[person] = []
      end
      assignments[person].push(assignment_attributes)
    end

    assignments.each_pair do |person, assignments_for_person|
      puts person.name

      assignments_for_person.each do |assignment|
        if person.assignments.count == 0
          Assignment.create(assignment)
          next
        end
        current_team = person.assignments.all.last.team
        new_team = assignment[:team]
        # puts "#{current_team.name} :: #{new_team.name}"

        next unless current_team.name != new_team.name
        puts "end assignment for #{current_team.name} on #{assignment[:effective_date]}"
        person.assignments.last.complete(assignment[:effective_date])
        Assignment.create(assignment)
      end
    end
  end

  # desc "Imports Projects from a trackslog CSV"
  # task :projects, [:path] => :environment do |task, args|
  #   ProjectRow = Struct.new(:week, :team, :status, :track)
  #   options = {headers: true, header_converters: :symbol}
  #   CSV.foreach(args.path, options).each do |row|
  #     # create project if it does not yet exist
  #     pr = ProjectRow.new(row[:week], row[:team], row[:status], row[:track])
  #     project = Project.find_by(name: pr.track, team: Team.find_by(name: pr.team))
  #   end
  # end
end
