require './company'

company = Company.new("My company")
company.add_project("Project1")
company.add_project("Project2")
company.add_project("Project3")

team = Team.new("My development team")
team_2 = Team.new("My testing team")

company.assign_team_to_project("Project1", team)
company.assign_team_to_project("Project2", team_2)

puts "List assembled teams:", company.list_assembled_teams
puts "List projects:", company.list_projects

puts "Find specific team:"
team = company.find_assembled_team("My testing team")
puts "Team found is #{team.name}"

puts "Remove project:"
company.remove_project("Project3")

puts "List assembled teams:", company.list_assembled_teams
puts "List projects:", company.list_projects

puts "Remove project:"
company.remove_project("Project1")

puts "List assembled teams:", company.list_assembled_teams
puts "List projects:", company.list_projects