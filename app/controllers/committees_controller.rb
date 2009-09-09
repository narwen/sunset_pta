class CommitteesController < ApplicationController

  access_control :only => :index do
    allow logged_in
  end

  access_control :only => [:new, :edit, :create, :update, :destroy] do
    allow :admin
  end

  access_control :helper => :can_edit_committees? do
    allow :admin
  end
  
  # GET /committees
  # GET /committees.xml
  def index
    @committees = Committee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @committees }
    end
  end

  # GET /committees/new
  # GET /committees/new.xml
  def new
    @committee = Committee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @committee }
    end
  end

  # GET /committees/1/edit
  def edit
    @committee = Committee.find(params[:id])
  end

  # POST /committees
  # POST /committees.xml
  def create
    @committee = Committee.new(params[:committee])

    respond_to do |format|
      if @committee.save
        flash[:notice] = 'Committee was successfully created.'
        format.html { redirect_to committees_path }
        format.xml  { render :xml => @committee, :status => :created, :location => @committee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @committee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /committees/1
  # PUT /committees/1.xml
  def update
    @committee = Committee.find(params[:id])

    respond_to do |format|
      if @committee.update_attributes(params[:committee])
        flash[:notice] = 'Committee was successfully updated.'
        format.html { redirect_to committees_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @committee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /committees/1
  # DELETE /committees/1.xml
  def destroy
    @committee = Committee.find(params[:id])
    @committee.destroy

    respond_to do |format|
      format.html { redirect_to(committees_url) }
      format.xml  { head :ok }
    end
  end
end
