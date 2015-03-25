require './Company'


firma=Company.new("m3r")

firma.addProject("testing")
firma.removeProject("testing")
##firma.listProjects
firma.assignTeam("testing", "testers1")
firma.assignTeam("testing", "testers2")
firma.listTeams
puts firma.getTeam("testers1").getName


