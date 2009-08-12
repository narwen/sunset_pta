require File.dirname(__FILE__) + '/../../spec_helper'

describe "users/edit.html.erb" do
  before do
    @mock_user = mock_model(User).as_null_object
    assigns[:user] = @mock_user
  end

  it "should display the board position field when can_assign_position? is true" do
    template.stub(:can_assign_position?).and_return(true)

    render

    response.should have_selector("select", :name => "user[position_id]")
  end

  it "should not display the board position field when can_assign_position? is false" do
    template.stub(:can_assign_position?).and_return(false)

    render

    response.should_not have_selector("select", :name => "user[position_id]")
  end
end
