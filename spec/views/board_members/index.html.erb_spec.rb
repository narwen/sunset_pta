require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/board_members/index.html.erb" do
  include BoardMembersHelper

  before(:each) do
    assigns[:board_members] = [
      stub_model(BoardMember),
      stub_model(BoardMember)
    ]
  end

  it "renders a list of board_members" do
    render
  end
end
