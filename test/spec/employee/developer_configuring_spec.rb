require_relative "../../helpers/company_creator"

describe "Configuring developer" do

	before :each do
		@dev=Developer.new("John","Doe",1)
	end

	context "Add C++ to list of programming languages" do
		it "language added" do
			@dev.add_language("C++")
			expect(@dev.languages.select { |lang| lang=="C++" }[0]).to be_truthy
		end
	end

	context "Complete valid number of tasks: 10" do
		it "tasks completed" do
			@dev.complete_tasks(10)
			expect(@dev.tasks_competed).to eql(10)
		end
	end

	context "Find C++ in the list of programming languages" do
		before do
			@dev.add_language("C++")
		end
		it "language found" do
			expect(@dev.find_language("C++")).to be_truthy
		end
	end

	context "Add a nonstring to list of programming languages" do
		it "language adding failed" do
			expect{ @dev.add_language(123) }.to raise_error
		end
	end

	context "Add an existing language to list of programming languages" do
		before do
			@dev.add_language("C++")
		end
		it "language adding failed" do
			expect{ @dev.add_language("C++") }.to raise_error
		end
	end

	context "Complete invalid number of tasks: -1" do
		it "completing tasks failed" do
			expect{ @dev.complete_tasks(-1) }.to raise_error
		end
	end
end