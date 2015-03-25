require './company'


firma=Company.new("m3r")

firma.add_project("testing")
firma.remove_project("testing")
firma.assign_team("testing", "testers1")
firma.assign_team("testing", "testers2")
firma.list_teams
puts firma.find_team("testers1").name


