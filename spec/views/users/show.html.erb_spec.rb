require File.dirname(__FILE__) + '/../../spec_helper'

describe "users/show.html.erb" do
  before do
    @mock_user = mock_model(User).as_null_object
    assigns[:user] = @mock_user
  end

  it "should display an edit link when show_edit_link? is true" do
    template.stub(:show_edit_link?).and_return(true)

    render

    response.should have_selector("a", :href => edit_user_path(@mock_user))
  end
  
  it "should not display an edit link when show_edit_link? is false" do
    template.stub(:show_edit_link?).and_return(false)

    render

    response.should_not have_selector("a", :href => edit_user_path(@mock_user))
  end
end
