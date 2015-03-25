require './Employee'

class Developer < Employee

	def initialize(first, last, languages, id=0)
		super(first,last,id)
		@languages=languages
		@projects={}
	end

	def listLanguages
		print "I know the following programming languages: "
		@languages.each do |language|
			print language + " "
		end
		print "\n"
	end

	def getProjects
		@projects
	end

	def getLanguages
		@languages
	end

	def addProject(name, language)
		@projects[name.to_sym]=language.to_sym
		puts "Project #{name} written in #{language} added!"
	end

	def listProjects
		puts "I have contributed to the following projects: "
		@projects.each do |proj,lang|
			puts "#{proj.to_s} written in #{lang.to_s}"
		end
	end

end
