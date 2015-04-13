output=""	

File.open("rspec2db.yml", "r") do |io| 
	while line = io.gets
		if line.include?("build:")
			num=line[line.index('"')..-1]
			num.slice!('"')
			num.slice!('"')
			output+="  build: \"#{num.to_i + 1}\"\n"
		else
			output+=line		
		end
	end
end

File.open("rspec2db.yml", "w") do |io|
	io.write(output)
end