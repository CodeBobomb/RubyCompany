require_relative "../../helpers/company_creator"

describe "adding member to a team/project " do
before :all do
	@company=CompanyCreator.create_company
	@team=@company.teams[0]
end
context "adding a new member to existing team/project " do
	let(:dev) { Developer.new("John","Doe",555) }
it " adds a new developer " do
	@team.add_member(dev)
	expect(@team.has_member?(dev.id)).to eql(true)
end
end
context "adding existing member to existing team/project " do
	let(:dev) { Developer.new("John","Doe",@team.developers[0].id) }
it " adds a existing developer " do
	expect(@team.add_member(dev)).to raise_error
end
end
end