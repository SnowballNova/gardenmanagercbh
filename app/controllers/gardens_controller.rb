class GardensController < ApplicationController
  def index
    if params[:search]
      @gardens = Garden.find_by_sql("SELECT * FROM gardens WHERE name ILIKE '%#{params[:search]}%'")
    else
      @gardens = Garden.all
    end
  end

  def show
    @garden = Garden.find(params[:id])
    @plant = Plant.new
    @plants = @garden.plants
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :banner_url)
  end
end
