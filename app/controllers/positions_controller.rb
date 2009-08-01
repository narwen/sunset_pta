class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def edit
    @position = Position.find(params[:id])
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
end
