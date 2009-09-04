require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/board_members/edit.html.erb" do
  include BoardMembersHelper

  before(:each) do
    assigns[:board_member] = @board_member = stub_model(BoardMember,
      :new_record? => false
    )
  end

  it "renders the edit board_member form" do
    render

    response.should have_tag("form[action=#{board_member_path(@board_member)}][method=post]") do
    end
  end
end
