require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/board_members/new.html.erb" do
  include BoardMembersHelper

  before(:each) do
    assigns[:board_member] = stub_model(BoardMember,
      :new_record? => true
    )
  end

  it "renders new board_member form" do
    render

    response.should have_tag("form[action=?][method=post]", board_members_path) do
    end
  end
end
