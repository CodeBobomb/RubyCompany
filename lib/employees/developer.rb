require_relative './employee'

class Developer < Employee

	attr_reader :languages
	attr_reader :projects

	def initialize(first, last, languages, id=0)
		super(first,last,id)
		@languages=languages
		@projects={}
	end

	def list_languages
		print "I know the following programming languages: "
		@languages.each do |language|
			print language + " "
		end
		print "\n"
	end

	def add_language(language)
		@languages << language
	end


	def calculate_pay
		super + @wage*0.3*@languages.length
	end

end
