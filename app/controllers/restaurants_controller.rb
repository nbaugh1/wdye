class RestaurantsController < ApplicationController
  
  helper_method :create_from_yelp

  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = create_from_yelp(params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def create_from_yelp(params)
    yelp_result = YelpApiAdapter.search(params[:restaurant][:name])[0]
    restaurant = Restaurant.new do |u|
      u.name = yelp_result["name"]
      u.neighborhood = yelp_result["location"]["city"]
    end
    binding.pry
    restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :neighborhood)
  end
end
