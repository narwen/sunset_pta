require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should demote other users when assigned a position" do
    mock_position = mock_model(Position)
    new_holder = Factory(:user)
    mock_position.should_receive(:demote_others).with(new_holder)

    new_holder.position = mock_position
    new_holder.save
  end
end
