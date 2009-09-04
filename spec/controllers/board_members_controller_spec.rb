require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BoardMembersController do

  def mock_board_member(stubs={})
    @mock_board_member ||= mock_model(BoardMember, stubs)
  end

  describe "GET index" do
    it "assigns all board_members as @board_members" do
      BoardMember.stub!(:find).with(:all).and_return([mock_board_member])
      get :index
      assigns[:board_members].should == [mock_board_member]
    end
  end

  describe "GET show" do
    it "assigns the requested board_member as @board_member" do
      BoardMember.stub!(:find).with("37").and_return(mock_board_member)
      get :show, :id => "37"
      assigns[:board_member].should equal(mock_board_member)
    end
  end

  describe "GET new" do
    it "assigns a new board_member as @board_member" do
      BoardMember.stub!(:new).and_return(mock_board_member)
      get :new
      assigns[:board_member].should equal(mock_board_member)
    end
  end

  describe "GET edit" do
    it "assigns the requested board_member as @board_member" do
      BoardMember.stub!(:find).with("37").and_return(mock_board_member)
      get :edit, :id => "37"
      assigns[:board_member].should equal(mock_board_member)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created board_member as @board_member" do
        BoardMember.stub!(:new).with({'these' => 'params'}).and_return(mock_board_member(:save => true))
        post :create, :board_member => {:these => 'params'}
        assigns[:board_member].should equal(mock_board_member)
      end

      it "redirects to the created board_member" do
        BoardMember.stub!(:new).and_return(mock_board_member(:save => true))
        post :create, :board_member => {}
        response.should redirect_to(board_member_url(mock_board_member))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved board_member as @board_member" do
        BoardMember.stub!(:new).with({'these' => 'params'}).and_return(mock_board_member(:save => false))
        post :create, :board_member => {:these => 'params'}
        assigns[:board_member].should equal(mock_board_member)
      end

      it "re-renders the 'new' template" do
        BoardMember.stub!(:new).and_return(mock_board_member(:save => false))
        post :create, :board_member => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested board_member" do
        BoardMember.should_receive(:find).with("37").and_return(mock_board_member)
        mock_board_member.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :board_member => {:these => 'params'}
      end

      it "assigns the requested board_member as @board_member" do
        BoardMember.stub!(:find).and_return(mock_board_member(:update_attributes => true))
        put :update, :id => "1"
        assigns[:board_member].should equal(mock_board_member)
      end

      it "redirects to the board_member" do
        BoardMember.stub!(:find).and_return(mock_board_member(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(board_member_url(mock_board_member))
      end
    end

    describe "with invalid params" do
      it "updates the requested board_member" do
        BoardMember.should_receive(:find).with("37").and_return(mock_board_member)
        mock_board_member.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :board_member => {:these => 'params'}
      end

      it "assigns the board_member as @board_member" do
        BoardMember.stub!(:find).and_return(mock_board_member(:update_attributes => false))
        put :update, :id => "1"
        assigns[:board_member].should equal(mock_board_member)
      end

      it "re-renders the 'edit' template" do
        BoardMember.stub!(:find).and_return(mock_board_member(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested board_member" do
      BoardMember.should_receive(:find).with("37").and_return(mock_board_member)
      mock_board_member.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the board_members list" do
      BoardMember.stub!(:find).and_return(mock_board_member(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(board_members_url)
    end
  end

end
