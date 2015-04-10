require_relative "../../../lib/employees/employee"

describe "employee unit test " do
	context "valid data " do
		before :all do
			@emp = Employee.new("John","Doe",1)
		end

		context "initialization " do

			it "first name: John" do
				expect(@emp.first_name).to eql("John")
			end

			it "last name: Doe" do
				expect(@emp.last_name).to eql("Doe")
			end

			it "id: 1" do
				expect(@emp.id).to eql(1)
			end
		end

		context "salary attributes " do		
			before :all do
				@emp.wage=10
				@emp.worktime=8
				@emp.workdays=5
			end

			it "wage is 10" do
				expect(@emp.wage).to eql(10)
			end

			it "worktime: 8" do
				expect(@emp.worktime).to eql(8)
			end

			it "workdays: 5" do
				expect(@emp.workdays).to eql(5)
			end
		end
	end

	context "invalid data " do
		before :all do
			@emp = Employee.new("John","Doe",1)
		end
		it "initialization " do
			expect(Employee.new(1,1,-1)).to raise_error
		end

		it "wage is: -1 " do
			expect(@emp.wage=-1).to raise_error
		end

		it "worktime is: -1" do
			expect(@emp.worktime=-1).to raise_error
		end

		it "workhours is: -1" do
			expect(@emp.workhours=-1).to raise_error
		end
	end
end