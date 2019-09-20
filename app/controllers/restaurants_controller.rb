class RestaurantsController < ApplicationController
  helper_method :create_from_yelp

  def index
    if params[:term]
      @restaurants = Restaurant.where('name LIKE ?', "#{params[:term]}%")
      @yelp_results = YelpApiAdapter.search(params[:term])
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = find_or_create_from_yelp(params)
  end

  def edit
  end

  # def find_or_create_from_yelp(params)
  #   yelp_results = YelpApiAdapter.search(params[:restaurant][:name])
  #   restaurant = Restaurant.find_by(yelp_id: yelp_result["id"])
  #   if restaurant
  #     session[:restaurant_id] = restaurant.id
  #     redirect_to new_visit_path
  #   else
  #     restaurant = Restaurant.new do |r|
  #       r.name = yelp_result["name"]
  #       r.location = yelp_result["location"]["display_address"]
  #       r.yelp_id = yelp_result["id"]
  #       r.save
  #     end
  #     session[:restaurant_id] = restaurant.id
  #     redirect_to new_visit_path
  #   end
  #   restaurant
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :location, :term)
  end
end
