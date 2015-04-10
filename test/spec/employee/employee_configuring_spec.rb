require_relative "../../helpers/company_creator"

describe "configuring emplyoee atrributes " do
context "entering valid salary data " do
before :all do
 	@emp=Employee.new("John","Doe",1)
end 
it "sets hourly wage:20, workdays:5, worktime: 8 " do
	@emp.wage=20
	@emp.workdays=5
	@emp.worktime=8
	output_array=[@emp.wage,@emp.workdays,@emp.worktime]
	expect(output_array).to match_array([20,5,8])
end
end
	
context "entering invalid salary data " do
before :all do
	@emp=Employee.new("John","Doe",1)
end
context "invalid wage " do
it "tries setting wage to -1 " do
	expect(@emp.wage=-1).to raise_error
end
end
context "invalid workdays " do
it "tries setting workdays to -1 " do
	expect(@emp.workdays=-1).to raise_error
end
end
context "invalid worktime " do
it "tries setting worktime to -1  " do
	expect(@emp.worktime=-1).to raise_error
end
end
end

