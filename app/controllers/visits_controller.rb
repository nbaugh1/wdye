class VisitsController < ApplicationController

  def index
    @visits = Visit.all 
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @user = User.new
    @visit = Visit.new(user_id: current_user.id)
    if current_restaurant
      @restaurant = current_restaurant
      @visit.restaurant_id = @restaurant.id
    else
      @restaurant = Restaurant.new
    end
  end

  def create
    @visit = Visit.create(visit_params)
    @visit.save
    session[:restaurant_id] = nil
    redirect_to visit_path(@visit)
  end

  def edit
    
  end 
   
  def destroy
    @visit = Visit.find([:id])
    @visit.destroy
    redirect_to root_path
  end

  private

  def visit_params
    params.require(:visit).permit(:visit_date, :description, :user_id, :restaurant_id)
  end
end
