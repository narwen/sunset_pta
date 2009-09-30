class PositionsController < ApplicationController

  access_control do
    allow :admin
  end

  def index
    @positions = Position.all#(:order => :position)
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def edit
    @position = Position.find(params[:id])
    flash[:notice] = "Now editing position #{@position.title}"
  end

  def create
    @position = Position.new(params[:position])

    if @position.save
      flash[:notice] = "Position #{@position.title} Added Successfully"
      redirect_to(@position)
    else
      render :action => "new"
    end
  end

  def update
    @position = Position.find(params[:id])

    if @position.update_attributes(params[:position])
      flash[:notice] = 'Position was successfully updated.'
      redirect_to(@position)
    else
      render :action => "edit"
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    redirect_to(positions_url)
  end


  def sort
    @positions = Position.all
    @positions.each do | p |
      p.position = params["positions-list"].index(p.id.to_s)+1
      p.save
    end
    render :nothing => true
  end

end
