require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should demote other users when assigned a position" do
    mock_position = mock_model(Position)
    new_holder = Factory(:user)
    mock_position.should_receive(:demote_others).with(new_holder)

    new_holder.position = mock_position
    new_holder.save
  end
  
  it "should get the board_member role when elected to a position" do
    mock_position = mock_model(Position).as_null_object
    mock_position.stub(:demote_others)
    new_holder = Factory(:user)

    new_holder.position = mock_position
    new_holder.save
    
    new_holder.should have_role(:board_member)
  end
  
  it "should lose the board_member role when demoted from a position" do
    old_holder = Factory(:user)
    old_holder.has_role!(:board_member)

    old_holder.save
    old_holder.should_not have_role(:board_member)
  end
end
