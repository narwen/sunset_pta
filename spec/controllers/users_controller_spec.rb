require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController, "PUT update" do
  def do_request
    put :update, :user => 'fake params'
  end

  before do
    @mock_current_user = mock_model(User).as_null_object
    controller.stub(:current_user).and_return(@mock_current_user)
    
    @mock_user = mock_model(User).as_null_object
    User.stub(:find).and_return(@mock_user)
  end
  
  it "should allow admins" do
    @mock_current_user.stub(:has_role?).with(["admin", nil]).and_return(true)
    
    lambda { do_request }.should_not raise_error(Acl9::AccessDenied)
  end

  it "should allow board members" do
    @mock_current_user.stub(:has_role?).with(["admin", nil]).and_return(false)
    @mock_current_user.stub(:has_role?).with(["board_member", nil]).and_return(true)
        
    lambda { do_request }.should_not raise_error(Acl9::AccessDenied)
  end

  it "should allow the same user" do
    @mock_current_user.stub(:has_role?).and_return(false)
    User.stub(:find).and_return(@mock_current_user)

    lambda { do_request }.should_not raise_error(Acl9::AccessDenied)
  end
    
  
  it "should not allow other users" do
    @mock_current_user.stub(:has_role?).and_return(false)

    lambda { do_request }.should raise_error(Acl9::AccessDenied)
  end
end
