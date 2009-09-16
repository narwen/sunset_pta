require File.dirname(__FILE__) + '/../spec_helper'

describe Committee do

  before(:each) do
    @chair1 = Factory(:user, :email => "chair1@example.com")
    @chair2 = Factory(:user, :email => "chair2@example.com")
    @volunteer = Factory(:user, :email => "volunteer@example.com")
    @test_committee = Factory(:committee, :name => "test")

    @chair1_assignment = Factory(:assignment, :user_id => @chair1.id,
                                               :committee_id => @test_committee.id,
                                               :duty_id => Duty.find_by_name("Chair").id)
    @chair2_assignment = Factory(:assignment, :user_id => @chair2.id,
                                               :committee_id => @test_committee.id,
                                               :duty_id => Duty.find_by_name("Chair").id)
    @volunteer_assignment = Factory(:assignment, :user_id => @volunteer.id,
                                               :committee_id => @test_committee.id,
                                               :duty_id => Duty.find_by_name("Volunteer").id)

  end

  it "should respond with correct list of chairs" do
    
    @test_committee.chairs.size.should == 2
    @test_committee.chairs.exists?(:id => @chair1.id).should == true
    @test_committee.chairs.exists?(:id => @chair2.id).should == true
    
  end

  it "should respond with correct list of volunteers" do

    @test_committee.volunteers.size.should == 1
    @test_committee.volunteers.exists?(:id => @volunteer.id).should == true

  end
end
