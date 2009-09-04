require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/board_members/show.html.erb" do
  include BoardMembersHelper
  before(:each) do
    assigns[:board_member] = @board_member = stub_model(BoardMember)
  end

  it "renders attributes in <p>" do
    render
  end
end
