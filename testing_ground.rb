require './company'

company = Company.new("My company")
company.add_project("Project1")
company.add_project("Project2")
company.add_project("Project3")

team = Team.new("My development team")
team.assign_manager("Jasmin")
team.add_developer("Haris")
team.add_developer("Aldin")
team.add_developer("Dario")

team_2 = Team.new("My testing team")
team_2.assign_manager("Jasmin")
team_2.add_developer("Bakir")
team_2.add_developer("Aldin")
team_2.add_developer("Dario")

team_3 = Team.new("My another team")
team_3.assign_manager("Jasmin")
team_3.add_developer("Haris")
team_3.add_developer("Bakir")
team_3.add_developer("Dario")

team_4 = Team.new("Yet another team")
team_4.assign_manager("Samra")
team_4.add_developer("Bakir")
team_4.add_developer("Aldin")
team_4.add_developer("Dario")

company.assign_team_to_project("Project1", team)
company.assign_team_to_project("Project2", team_2)
company.assign_team_to_project("Project3", team_3)

manager = Manager.new("Jasmin", "Velic")
manager.hourly_wage(20)
manager.working_day(21)
manager.worktime(8)

manager_2 = Manager.new("Alma", "Kalauzovic")

developer = Developer.new("Bakir", "Jusufbegovic", "")
developer_2 = Developer.new("Haris", "Krajina", "")
developer_3 = Developer.new("Dario", "Duvnjak", "")
developer_4 = Developer.new("Aldin", "Milanovic", "")

puts "Calculate payment for managers:"
puts "Jasmin Velic works on:" 
puts manager.get_number_of_assigned_projects("Jasmin", company.list_assembled_teams)

puts "Jasmin Velic payment is:"
puts manager.calculate_pay







