class RestaurantsController < ApplicationController
  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :neighborhood)
  end
end
