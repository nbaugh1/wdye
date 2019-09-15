class VisitsController < ApplicationController

  def index
    @visits = Visit.all 
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new(user_id: params[:user_id])
  end

  def create
    @visit = Visit.create(visit_params)
    # @visit.user_id = current_user.id
    @visit.save
    
    redirect_to visit_path(@visit)
  end

  def edit
    
  end

  private

  def visit_params
    params.require(:visit).permit(:visit_date, :description, :user_id)
  end
end
