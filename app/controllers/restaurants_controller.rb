class RestaurantsController < ApplicationController
  
  helper_method :create_from_yelp

  def index
    @restaurants = Restaurant.all 
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
    redirect_to restaurants_path
  end

  def edit
  end

  def create_from_yelp(params)
    yelp_result = YelpApiAdapter.search(params[:restaurant][:name])[0]
    restaurant = Restaurant.new do |u|
      u.name = yelp_result["name"]
      u.location = yelp_result["location"]["display_address"]
    end
    restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :location)
  end
end
