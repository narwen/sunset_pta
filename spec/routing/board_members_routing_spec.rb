require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoardMembersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "board_members", :action => "index").should == "/board_members"
    end

    it "maps #new" do
      route_for(:controller => "board_members", :action => "new").should == "/board_members/new"
    end

    it "maps #show" do
      route_for(:controller => "board_members", :action => "show", :id => "1").should == "/board_members/1"
    end

    it "maps #edit" do
      route_for(:controller => "board_members", :action => "edit", :id => "1").should == "/board_members/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "board_members", :action => "create").should == {:path => "/board_members", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "board_members", :action => "update", :id => "1").should == {:path =>"/board_members/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "board_members", :action => "destroy", :id => "1").should == {:path =>"/board_members/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/board_members").should == {:controller => "board_members", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/board_members/new").should == {:controller => "board_members", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/board_members").should == {:controller => "board_members", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/board_members/1").should == {:controller => "board_members", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/board_members/1/edit").should == {:controller => "board_members", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/board_members/1").should == {:controller => "board_members", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/board_members/1").should == {:controller => "board_members", :action => "destroy", :id => "1"}
    end
  end
end
