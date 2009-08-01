require File.dirname(__FILE__) + '/../spec_helper'

describe Position do
  it "should be valid with valid attributes" do
    Factory.build(:position).should be_valid
  end

  it "should require a unique title" do
    Factory(:position, :title => "President")
    Factory.build(:position, :title => "President").should_not be_valid
  end
end
